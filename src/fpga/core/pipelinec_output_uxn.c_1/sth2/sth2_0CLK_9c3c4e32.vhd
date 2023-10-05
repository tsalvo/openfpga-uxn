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
-- Submodules: 95
entity sth2_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_9c3c4e32;
architecture arch of sth2_0CLK_9c3c4e32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2299_c6_99c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2299_c1_bcb0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2299_c2_c1d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2299_c2_c1d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2299_c2_c1d6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2299_c2_c1d6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2299_c2_c1d6]
signal result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2299_c2_c1d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2299_c2_c1d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2299_c2_c1d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2299_c2_c1d6]
signal t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2300_c3_2fa6[uxn_opcodes_h_l2300_c3_2fa6]
signal printf_uxn_opcodes_h_l2300_c3_2fa6_uxn_opcodes_h_l2300_c3_2fa6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_265a]
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_cb6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_cb6b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2305_c7_cb6b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2305_c7_cb6b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2305_c7_cb6b]
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_cb6b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_cb6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_cb6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2305_c7_cb6b]
signal t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2308_c11_d13a]
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2308_c7_f300]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2308_c7_f300]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2308_c7_f300]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2308_c7_f300]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2308_c7_f300]
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2308_c7_f300]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2308_c7_f300]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2308_c7_f300]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2308_c7_f300]
signal t16_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2310_c3_1cdc]
signal CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2313_c11_76cf]
signal BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2313_c7_56a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2313_c7_56a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2313_c7_56a3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2313_c7_56a3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2313_c7_56a3]
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2313_c7_56a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2313_c7_56a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2313_c7_56a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2313_c7_56a3]
signal t16_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2316_c11_545d]
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2316_c7_6710]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2316_c7_6710]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2316_c7_6710]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2316_c7_6710]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2316_c7_6710]
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2316_c7_6710]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2316_c7_6710]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2316_c7_6710]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2316_c7_6710]
signal t16_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2317_c3_3662]
signal BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2320_c11_da3c]
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2320_c7_3042]
signal result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2320_c7_3042]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2320_c7_3042]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2320_c7_3042]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2320_c7_3042]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2320_c7_3042]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2320_c7_3042]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2322_c32_1518]
signal BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2322_c32_dc54]
signal BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2322_c32_ea84]
signal MUX_uxn_opcodes_h_l2322_c32_ea84_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2322_c32_ea84_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2322_c32_ea84_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2322_c32_ea84_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2324_c11_aab9]
signal BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2324_c7_6464]
signal result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2324_c7_6464]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2324_c7_6464]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2324_c7_6464]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2324_c7_6464]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2324_c7_6464]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2324_c7_6464]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2328_c11_436b]
signal BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2328_c7_c357]
signal result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2328_c7_c357]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2328_c7_c357]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2328_c7_c357]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2328_c7_c357]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2328_c7_c357]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2334_c11_030c]
signal BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2334_c7_7ef4]
signal result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2334_c7_7ef4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2334_c7_7ef4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2334_c7_7ef4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2334_c7_7ef4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2336_c34_e0a7]
signal CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2338_c11_dd1e]
signal BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2338_c7_fdc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2338_c7_fdc3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2338_c7_fdc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_0cb8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8
BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6
result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6
result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output);

-- t16_MUX_uxn_opcodes_h_l2299_c2_c1d6
t16_MUX_uxn_opcodes_h_l2299_c2_c1d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond,
t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue,
t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse,
t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output);

-- printf_uxn_opcodes_h_l2300_c3_2fa6_uxn_opcodes_h_l2300_c3_2fa6
printf_uxn_opcodes_h_l2300_c3_2fa6_uxn_opcodes_h_l2300_c3_2fa6 : entity work.printf_uxn_opcodes_h_l2300_c3_2fa6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2300_c3_2fa6_uxn_opcodes_h_l2300_c3_2fa6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_left,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_right,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b
result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output);

-- t16_MUX_uxn_opcodes_h_l2305_c7_cb6b
t16_MUX_uxn_opcodes_h_l2305_c7_cb6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond,
t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue,
t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse,
t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_left,
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_right,
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_cond,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_return_output);

-- t16_MUX_uxn_opcodes_h_l2308_c7_f300
t16_MUX_uxn_opcodes_h_l2308_c7_f300 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2308_c7_f300_cond,
t16_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue,
t16_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse,
t16_MUX_uxn_opcodes_h_l2308_c7_f300_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc
CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_x,
CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_left,
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_right,
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3
result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3
result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output);

-- t16_MUX_uxn_opcodes_h_l2313_c7_56a3
t16_MUX_uxn_opcodes_h_l2313_c7_56a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2313_c7_56a3_cond,
t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue,
t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse,
t16_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_left,
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_right,
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_cond,
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_return_output);

-- t16_MUX_uxn_opcodes_h_l2316_c7_6710
t16_MUX_uxn_opcodes_h_l2316_c7_6710 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2316_c7_6710_cond,
t16_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue,
t16_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse,
t16_MUX_uxn_opcodes_h_l2316_c7_6710_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662
BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_left,
BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_right,
BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_left,
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_right,
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042
result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_cond,
result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518
BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_left,
BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_right,
BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54
BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_left,
BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_right,
BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_return_output);

-- MUX_uxn_opcodes_h_l2322_c32_ea84
MUX_uxn_opcodes_h_l2322_c32_ea84 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2322_c32_ea84_cond,
MUX_uxn_opcodes_h_l2322_c32_ea84_iftrue,
MUX_uxn_opcodes_h_l2322_c32_ea84_iffalse,
MUX_uxn_opcodes_h_l2322_c32_ea84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9
BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_left,
BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_right,
BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464
result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_cond,
result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464
result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464
result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464
result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464
result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_left,
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_right,
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357
result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_cond,
result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357
result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357
result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c
BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_left,
BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_right,
BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4
result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4
result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4
result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7
CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_x,
CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e
BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_left,
BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_right,
BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3
result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3
result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
 t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output,
 t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_return_output,
 t16_MUX_uxn_opcodes_h_l2308_c7_f300_return_output,
 CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output,
 t16_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_return_output,
 t16_MUX_uxn_opcodes_h_l2316_c7_6710_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_return_output,
 MUX_uxn_opcodes_h_l2322_c32_ea84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output,
 CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_2884 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2300_c3_2fa6_uxn_opcodes_h_l2300_c3_2fa6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_dbc5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2311_c3_92f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_7db8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2326_c3_287e : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2331_c3_25fc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2332_c24_83c1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2335_c3_22c6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2336_c24_e683_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2324_l2316_l2313_l2308_DUPLICATE_b788_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2308_l2334_DUPLICATE_efd7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2316_l2313_l2308_DUPLICATE_46d7_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2305_l2316_l2308_l2313_DUPLICATE_1b42_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2317_l2309_DUPLICATE_b30e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2316_l2320_l2334_l2324_DUPLICATE_465f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0cb8_uxn_opcodes_h_l2295_l2344_DUPLICATE_8e5b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2311_c3_92f4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2311_c3_92f4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_2884 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_2884;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_dbc5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_dbc5;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2331_c3_25fc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2331_c3_25fc;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2335_c3_22c6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2335_c3_22c6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2326_c3_287e := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2326_c3_287e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_7db8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_7db8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2338_c11_dd1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2336_c34_e0a7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_return_output := CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2308_c11_d13a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2320_c11_da3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2316_l2313_l2308_DUPLICATE_46d7 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2316_l2313_l2308_DUPLICATE_46d7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2334_c11_030c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2328_c11_436b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_265a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2316_c11_545d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2299_c6_99c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2308_l2334_DUPLICATE_efd7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2308_l2334_DUPLICATE_efd7_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2316_l2320_l2334_l2324_DUPLICATE_465f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2316_l2320_l2334_l2324_DUPLICATE_465f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2324_c11_aab9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2332_c24_83c1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2332_c24_83c1_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_AND[uxn_opcodes_h_l2322_c32_1518] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_left;
     BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_return_output := BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2305_l2316_l2308_l2313_DUPLICATE_1b42 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2305_l2316_l2308_l2313_DUPLICATE_1b42_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2317_l2309_DUPLICATE_b30e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2317_l2309_DUPLICATE_b30e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2324_l2316_l2313_l2308_DUPLICATE_b788 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2324_l2316_l2313_l2308_DUPLICATE_b788_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2313_c11_76cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2322_c32_1518_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c6_99c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_265a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_d13a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_76cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_545d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_da3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c11_aab9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_436b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2334_c11_030c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2338_c11_dd1e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2317_l2309_DUPLICATE_b30e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2317_l2309_DUPLICATE_b30e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2332_c24_83c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2316_l2313_l2308_DUPLICATE_46d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2316_l2313_l2308_DUPLICATE_46d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2316_l2313_l2308_DUPLICATE_46d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2316_l2313_l2308_DUPLICATE_46d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2316_l2313_l2308_DUPLICATE_46d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2316_l2313_l2308_DUPLICATE_46d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2305_l2328_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_ef53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2324_l2316_l2313_l2308_DUPLICATE_b788_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2324_l2316_l2313_l2308_DUPLICATE_b788_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2324_l2316_l2313_l2308_DUPLICATE_b788_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2324_l2316_l2313_l2308_DUPLICATE_b788_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2324_l2316_l2313_l2308_DUPLICATE_b788_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2324_l2316_l2313_l2308_DUPLICATE_b788_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2324_l2316_l2313_l2308_DUPLICATE_b788_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2305_l2328_l2299_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_bacb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2305_l2316_l2308_l2313_DUPLICATE_1b42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2305_l2316_l2308_l2313_DUPLICATE_1b42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2305_l2316_l2308_l2313_DUPLICATE_1b42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2305_l2316_l2308_l2313_DUPLICATE_1b42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2338_l2308_l2334_DUPLICATE_8313_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2316_l2320_l2334_l2324_DUPLICATE_465f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2316_l2320_l2334_l2324_DUPLICATE_465f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2316_l2320_l2334_l2324_DUPLICATE_465f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2316_l2320_l2334_l2324_DUPLICATE_465f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2308_l2334_DUPLICATE_efd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2308_l2334_DUPLICATE_efd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2308_l2334_DUPLICATE_efd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2308_l2334_DUPLICATE_efd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2308_l2334_DUPLICATE_efd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2308_l2334_DUPLICATE_efd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2308_l2334_DUPLICATE_efd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2305_l2299_l2324_l2320_l2316_l2313_l2308_l2334_DUPLICATE_efd7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2338_c7_fdc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2324_c7_6464] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2338_c7_fdc3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2310_c3_1cdc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_return_output := CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2338_c7_fdc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2299_c1_bcb0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2328_c7_c357] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2322_c32_dc54] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_left;
     BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_return_output := BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2334_c7_7ef4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2336_c24_e683] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2336_c24_e683_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2336_c34_e0a7_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2316_c7_6710] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2317_c3_3662] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_left;
     BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_return_output := BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2322_c32_dc54_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2317_c3_3662_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2336_c24_e683_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2310_c3_1cdc_return_output;
     VAR_printf_uxn_opcodes_h_l2300_c3_2fa6_uxn_opcodes_h_l2300_c3_2fa6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2299_c1_bcb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2338_c7_fdc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output;
     -- MUX[uxn_opcodes_h_l2322_c32_ea84] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2322_c32_ea84_cond <= VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_cond;
     MUX_uxn_opcodes_h_l2322_c32_ea84_iftrue <= VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_iftrue;
     MUX_uxn_opcodes_h_l2322_c32_ea84_iffalse <= VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_return_output := MUX_uxn_opcodes_h_l2322_c32_ea84_return_output;

     -- t16_MUX[uxn_opcodes_h_l2316_c7_6710] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2316_c7_6710_cond <= VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_cond;
     t16_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue;
     t16_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_return_output := t16_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2334_c7_7ef4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2324_c7_6464] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2334_c7_7ef4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2313_c7_56a3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2334_c7_7ef4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output;

     -- printf_uxn_opcodes_h_l2300_c3_2fa6[uxn_opcodes_h_l2300_c3_2fa6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2300_c3_2fa6_uxn_opcodes_h_l2300_c3_2fa6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2300_c3_2fa6_uxn_opcodes_h_l2300_c3_2fa6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2334_c7_7ef4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2328_c7_c357] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue := VAR_MUX_uxn_opcodes_h_l2322_c32_ea84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2334_c7_7ef4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2324_c7_6464] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;

     -- t16_MUX[uxn_opcodes_h_l2313_c7_56a3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2313_c7_56a3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_cond;
     t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue;
     t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output := t16_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2308_c7_f300] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2320_c7_3042] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2328_c7_c357] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2320_c7_3042] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2328_c7_c357] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2328_c7_c357] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2328_c7_c357] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_return_output := result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2328_c7_c357_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2305_c7_cb6b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2316_c7_6710] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2324_c7_6464] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2324_c7_6464] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_return_output := result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2324_c7_6464] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2324_c7_6464] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;

     -- t16_MUX[uxn_opcodes_h_l2308_c7_f300] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2308_c7_f300_cond <= VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_cond;
     t16_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue;
     t16_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_return_output := t16_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2320_c7_3042] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2316_c7_6710] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c7_6464_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2320_c7_3042] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;

     -- t16_MUX[uxn_opcodes_h_l2305_c7_cb6b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond;
     t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue;
     t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output := t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2313_c7_56a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2313_c7_56a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2320_c7_3042] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2299_c2_c1d6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2320_c7_3042] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2316_c7_6710] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2320_c7_3042] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_return_output := result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2320_c7_3042_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2308_c7_f300] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2316_c7_6710] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2308_c7_f300] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2316_c7_6710] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;

     -- t16_MUX[uxn_opcodes_h_l2299_c2_c1d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond;
     t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue;
     t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output := t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2316_c7_6710] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_return_output := result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2316_c7_6710] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2313_c7_56a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2316_c7_6710_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_cb6b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2313_c7_56a3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_cb6b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2313_c7_56a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2313_c7_56a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2313_c7_56a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2308_c7_f300] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_56a3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2299_c2_c1d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2299_c2_c1d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2308_c7_f300] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_return_output := result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2308_c7_f300] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_cb6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2308_c7_f300] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2308_c7_f300] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_f300_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2305_c7_cb6b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2299_c2_c1d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_cb6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_cb6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2305_c7_cb6b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_cb6b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2299_c2_c1d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2299_c2_c1d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2299_c2_c1d6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2299_c2_c1d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0cb8_uxn_opcodes_h_l2295_l2344_DUPLICATE_8e5b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0cb8_uxn_opcodes_h_l2295_l2344_DUPLICATE_8e5b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0cb8(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c2_c1d6_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0cb8_uxn_opcodes_h_l2295_l2344_DUPLICATE_8e5b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0cb8_uxn_opcodes_h_l2295_l2344_DUPLICATE_8e5b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
