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
-- Submodules: 141
entity ovr2_0CLK_57eb5902 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_57eb5902;
architecture arch of ovr2_0CLK_57eb5902 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l387_c6_104b]
signal BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l387_c1_bd0a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l387_c2_be36]
signal n16_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l387_c2_be36]
signal t16_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l387_c2_be36]
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l387_c2_be36]
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l387_c2_be36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l387_c2_be36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c2_be36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c2_be36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c2_be36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l387_c2_be36]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l388_c3_6982[uxn_opcodes_h_l388_c3_6982]
signal printf_uxn_opcodes_h_l388_c3_6982_uxn_opcodes_h_l388_c3_6982_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l395_c11_7ad1]
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l395_c7_e29a]
signal n16_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l395_c7_e29a]
signal t16_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l395_c7_e29a]
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_e29a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_e29a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_e29a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_e29a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_e29a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_e29a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l399_c11_2fe1]
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l399_c7_0d43]
signal n16_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l399_c7_0d43]
signal t16_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l399_c7_0d43]
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_0d43]
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_0d43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_0d43]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_0d43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_0d43]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_0d43]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l405_c11_8946]
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l405_c7_10c7]
signal n16_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l405_c7_10c7]
signal t16_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l405_c7_10c7]
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l405_c7_10c7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l405_c7_10c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l405_c7_10c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l405_c7_10c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l405_c7_10c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l405_c7_10c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l409_c11_8617]
signal BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l409_c7_753f]
signal n16_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l409_c7_753f]
signal t16_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l409_c7_753f]
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l409_c7_753f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l409_c7_753f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l409_c7_753f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l409_c7_753f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l409_c7_753f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l409_c7_753f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l410_c3_0d25]
signal BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l414_c11_6649]
signal BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l414_c7_0ffc]
signal n16_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l414_c7_0ffc]
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l414_c7_0ffc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l414_c7_0ffc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l414_c7_0ffc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l414_c7_0ffc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l414_c7_0ffc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c7_0ffc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l418_c11_edf2]
signal BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l418_c7_6b83]
signal n16_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l418_c7_6b83]
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l418_c7_6b83]
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l418_c7_6b83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l418_c7_6b83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l418_c7_6b83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l418_c7_6b83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l418_c7_6b83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l424_c11_dacc]
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l424_c7_dfce]
signal n16_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l424_c7_dfce]
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l424_c7_dfce]
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l424_c7_dfce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l424_c7_dfce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l424_c7_dfce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l424_c7_dfce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c7_dfce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l428_c11_b64a]
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l428_c7_3fc0]
signal n16_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l428_c7_3fc0]
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l428_c7_3fc0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l428_c7_3fc0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l428_c7_3fc0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l428_c7_3fc0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l428_c7_3fc0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l428_c7_3fc0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l429_c3_669e]
signal BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l433_c32_d16d]
signal BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l433_c32_1935]
signal BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l433_c32_3697]
signal MUX_uxn_opcodes_h_l433_c32_3697_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l433_c32_3697_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l433_c32_3697_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l433_c32_3697_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l435_c11_a814]
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l435_c7_c5b7]
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l435_c7_c5b7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l435_c7_c5b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c7_c5b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l435_c7_c5b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c7_c5b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c7_c5b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l443_c11_d392]
signal BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l443_c7_da82]
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l443_c7_da82]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l443_c7_da82]
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l443_c7_da82]
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l448_c11_628b]
signal BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l448_c7_aaac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l448_c7_aaac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l448_c7_aaac]
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l448_c7_aaac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l453_c11_a9de]
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l453_c7_f6f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l453_c7_f6f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l453_c7_f6f0]
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l453_c7_f6f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l456_c34_d012]
signal CONST_SR_8_uxn_opcodes_h_l456_c34_d012_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l456_c34_d012_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l458_c11_0e82]
signal BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l458_c7_82d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c7_82d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l458_c7_82d0]
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l458_c7_82d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l463_c11_dd22]
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l463_c7_33a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l463_c7_33a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l463_c7_33a4]
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l463_c7_33a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l468_c11_315a]
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l468_c7_ad54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l468_c7_ad54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l468_c7_ad54]
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l468_c7_ad54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_81ab( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b
BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_left,
BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_right,
BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_return_output);

-- n16_MUX_uxn_opcodes_h_l387_c2_be36
n16_MUX_uxn_opcodes_h_l387_c2_be36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l387_c2_be36_cond,
n16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue,
n16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse,
n16_MUX_uxn_opcodes_h_l387_c2_be36_return_output);

-- t16_MUX_uxn_opcodes_h_l387_c2_be36
t16_MUX_uxn_opcodes_h_l387_c2_be36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l387_c2_be36_cond,
t16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue,
t16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse,
t16_MUX_uxn_opcodes_h_l387_c2_be36_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36
result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_cond,
result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_return_output);

-- printf_uxn_opcodes_h_l388_c3_6982_uxn_opcodes_h_l388_c3_6982
printf_uxn_opcodes_h_l388_c3_6982_uxn_opcodes_h_l388_c3_6982 : entity work.printf_uxn_opcodes_h_l388_c3_6982_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l388_c3_6982_uxn_opcodes_h_l388_c3_6982_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1
BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_left,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_right,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output);

-- n16_MUX_uxn_opcodes_h_l395_c7_e29a
n16_MUX_uxn_opcodes_h_l395_c7_e29a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l395_c7_e29a_cond,
n16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue,
n16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse,
n16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output);

-- t16_MUX_uxn_opcodes_h_l395_c7_e29a
t16_MUX_uxn_opcodes_h_l395_c7_e29a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l395_c7_e29a_cond,
t16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue,
t16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse,
t16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a
result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_cond,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1
BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_left,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_right,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output);

-- n16_MUX_uxn_opcodes_h_l399_c7_0d43
n16_MUX_uxn_opcodes_h_l399_c7_0d43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l399_c7_0d43_cond,
n16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue,
n16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse,
n16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output);

-- t16_MUX_uxn_opcodes_h_l399_c7_0d43
t16_MUX_uxn_opcodes_h_l399_c7_0d43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l399_c7_0d43_cond,
t16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue,
t16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse,
t16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43
result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_cond,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946
BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_left,
BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_right,
BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output);

-- n16_MUX_uxn_opcodes_h_l405_c7_10c7
n16_MUX_uxn_opcodes_h_l405_c7_10c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l405_c7_10c7_cond,
n16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue,
n16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse,
n16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output);

-- t16_MUX_uxn_opcodes_h_l405_c7_10c7
t16_MUX_uxn_opcodes_h_l405_c7_10c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l405_c7_10c7_cond,
t16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue,
t16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse,
t16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7
result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617
BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_left,
BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_right,
BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output);

-- n16_MUX_uxn_opcodes_h_l409_c7_753f
n16_MUX_uxn_opcodes_h_l409_c7_753f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l409_c7_753f_cond,
n16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue,
n16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse,
n16_MUX_uxn_opcodes_h_l409_c7_753f_return_output);

-- t16_MUX_uxn_opcodes_h_l409_c7_753f
t16_MUX_uxn_opcodes_h_l409_c7_753f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l409_c7_753f_cond,
t16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue,
t16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse,
t16_MUX_uxn_opcodes_h_l409_c7_753f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f
result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_cond,
result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25
BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_left,
BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_right,
BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649
BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_left,
BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_right,
BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output);

-- n16_MUX_uxn_opcodes_h_l414_c7_0ffc
n16_MUX_uxn_opcodes_h_l414_c7_0ffc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l414_c7_0ffc_cond,
n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue,
n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse,
n16_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc
result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_cond,
result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2
BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_left,
BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_right,
BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output);

-- n16_MUX_uxn_opcodes_h_l418_c7_6b83
n16_MUX_uxn_opcodes_h_l418_c7_6b83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l418_c7_6b83_cond,
n16_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue,
n16_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse,
n16_MUX_uxn_opcodes_h_l418_c7_6b83_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83
result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_cond,
result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc
BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_left,
BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_right,
BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output);

-- n16_MUX_uxn_opcodes_h_l424_c7_dfce
n16_MUX_uxn_opcodes_h_l424_c7_dfce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l424_c7_dfce_cond,
n16_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue,
n16_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse,
n16_MUX_uxn_opcodes_h_l424_c7_dfce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce
result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_cond,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a
BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_left,
BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_right,
BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output);

-- n16_MUX_uxn_opcodes_h_l428_c7_3fc0
n16_MUX_uxn_opcodes_h_l428_c7_3fc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l428_c7_3fc0_cond,
n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue,
n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse,
n16_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0
result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_cond,
result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l429_c3_669e
BIN_OP_OR_uxn_opcodes_h_l429_c3_669e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_left,
BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_right,
BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d
BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_left,
BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_right,
BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l433_c32_1935
BIN_OP_GT_uxn_opcodes_h_l433_c32_1935 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_left,
BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_right,
BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_return_output);

-- MUX_uxn_opcodes_h_l433_c32_3697
MUX_uxn_opcodes_h_l433_c32_3697 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l433_c32_3697_cond,
MUX_uxn_opcodes_h_l433_c32_3697_iftrue,
MUX_uxn_opcodes_h_l433_c32_3697_iffalse,
MUX_uxn_opcodes_h_l433_c32_3697_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814
BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_left,
BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_right,
BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7
result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392
BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_left,
BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_right,
BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82
result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_cond,
result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b
BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_left,
BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_right,
BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac
result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_cond,
result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de
BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_left,
BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_right,
BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0
result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_cond,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l456_c34_d012
CONST_SR_8_uxn_opcodes_h_l456_c34_d012 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l456_c34_d012_x,
CONST_SR_8_uxn_opcodes_h_l456_c34_d012_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82
BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_left,
BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_right,
BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0
result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22
BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_left,
BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_right,
BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4
result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_cond,
result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a
BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_left,
BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_right,
BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54
result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_cond,
result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b
CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44
CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_return_output,
 n16_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
 t16_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output,
 n16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output,
 t16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output,
 n16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output,
 t16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output,
 n16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output,
 t16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output,
 n16_MUX_uxn_opcodes_h_l409_c7_753f_return_output,
 t16_MUX_uxn_opcodes_h_l409_c7_753f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output,
 n16_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output,
 n16_MUX_uxn_opcodes_h_l418_c7_6b83_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output,
 n16_MUX_uxn_opcodes_h_l424_c7_dfce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output,
 n16_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_return_output,
 MUX_uxn_opcodes_h_l433_c32_3697_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output,
 CONST_SR_8_uxn_opcodes_h_l456_c34_d012_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_5297 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l388_c3_6982_uxn_opcodes_h_l388_c3_6982_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_8e41 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_9181 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_2b07 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l412_c3_c604 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c3_5bad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_85c1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l426_c3_0d19 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_00d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_3697_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_3697_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_3697_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_3697_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l435_c7_c5b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l437_c3_e73c : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l440_c3_56dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l445_c3_8dd7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l450_c3_2827 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l451_c24_b6c7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_2560 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_d012_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_d012_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l456_c24_bf99_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_6c2a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_5f3a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_4a01 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_ad54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l471_c3_ec05 : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_8a8f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_19ec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_78f0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l475_l383_DUPLICATE_7c39_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_8e41 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_8e41;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_2560 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_2560;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_5f3a := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_5f3a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l412_c3_c604 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l412_c3_c604;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_85c1 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_85c1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_6c2a := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_6c2a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_5297 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_5297;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l440_c3_56dc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l440_c3_56dc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_right := to_unsigned(11, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l437_c3_e73c := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l437_c3_e73c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l426_c3_0d19 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l426_c3_0d19;
     VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l433_c32_3697_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iffalse := to_unsigned(0, 1);
     VAR_result_stack_value_uxn_opcodes_h_l471_c3_ec05 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue := VAR_result_stack_value_uxn_opcodes_h_l471_c3_ec05;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_2b07 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_2b07;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l445_c3_8dd7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l445_c3_8dd7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_9181 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_9181;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c3_5bad := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c3_5bad;
     VAR_MUX_uxn_opcodes_h_l433_c32_3697_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l450_c3_2827 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l450_c3_2827;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_4a01 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_4a01;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_right := to_unsigned(15, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_right := to_unsigned(14, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_00d9 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_00d9;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_right := to_unsigned(10, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_d012_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l414_c11_6649] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_left;
     BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output := BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l395_c11_7ad1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_left;
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output := BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l433_c32_d16d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_left;
     BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_return_output := BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l456_c34_d012] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l456_c34_d012_x <= VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_d012_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_d012_return_output := CONST_SR_8_uxn_opcodes_h_l456_c34_d012_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_19ec LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_19ec_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l405_c11_8946] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_left;
     BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output := BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output := result.stack_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l451_c24_b6c7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l451_c24_b6c7_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l435_c7_c5b7] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l435_c7_c5b7_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l399_c11_2fe1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_left;
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output := BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l387_c6_104b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_left;
     BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output := BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l463_c11_dd22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_left;
     BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_return_output := BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l458_c11_0e82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_left;
     BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_return_output := BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_8a8f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_8a8f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l468_c11_315a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_left;
     BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_return_output := BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l435_c11_a814] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_left;
     BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output := BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l424_c11_dacc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_left;
     BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output := BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l409_c11_8617] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_left;
     BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output := BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l428_c11_b64a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_left;
     BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output := BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l443_c11_d392] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_left;
     BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_return_output := BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l453_c11_a9de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_left;
     BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_return_output := BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l418_c11_edf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l387_c2_be36] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l387_c2_be36_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l448_c11_628b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_left;
     BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_return_output := BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l468_c7_ad54] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_ad54_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_left := VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_d16d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_104b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_7ad1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_2fe1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_8946_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8617_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_6649_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_edf2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_dacc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_b64a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_a814_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_d392_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_628b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_a9de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0e82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_dd22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_315a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_8a8f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_8a8f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_8a8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l451_c24_b6c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_19ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_19ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_d2b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_l418_l453_DUPLICATE_92e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l414_l409_l405_l435_l399_l395_l424_l387_l418_DUPLICATE_b9bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l418_DUPLICATE_b34c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l414_l409_l405_l468_l399_l428_l395_l424_l387_l418_DUPLICATE_9d71_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l387_c2_be36_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l435_c7_c5b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_ad54_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l468_c7_ad54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l435_c7_c5b7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l410_c3_0d25] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_left;
     BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_return_output := BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_78f0 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_78f0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af44_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l468_c7_ad54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l468_c7_ad54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l429_c3_669e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_left;
     BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_return_output := BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c7_c5b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l387_c2_be36] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l468_c7_ad54] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_cond;
     result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_return_output := result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l456_c24_bf99] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l456_c24_bf99_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_d012_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c7_c5b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l387_c1_bd0a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l433_c32_1935] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_left;
     BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_return_output := BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l433_c32_3697_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_1935_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_0d25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_669e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l456_c24_bf99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_78f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_78f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l420_l401_DUPLICATE_671b_return_output;
     VAR_printf_uxn_opcodes_h_l388_c3_6982_uxn_opcodes_h_l388_c3_6982_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_bd0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_ad54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_ad54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_ad54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_ad54_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l463_c7_33a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_return_output;

     -- n16_MUX[uxn_opcodes_h_l428_c7_3fc0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l428_c7_3fc0_cond <= VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_cond;
     n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue;
     n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output := n16_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l463_c7_33a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l428_c7_3fc0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l428_c7_3fc0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;

     -- t16_MUX[uxn_opcodes_h_l409_c7_753f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l409_c7_753f_cond <= VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_cond;
     t16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue;
     t16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_return_output := t16_MUX_uxn_opcodes_h_l409_c7_753f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l463_c7_33a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_return_output;

     -- MUX[uxn_opcodes_h_l433_c32_3697] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l433_c32_3697_cond <= VAR_MUX_uxn_opcodes_h_l433_c32_3697_cond;
     MUX_uxn_opcodes_h_l433_c32_3697_iftrue <= VAR_MUX_uxn_opcodes_h_l433_c32_3697_iftrue;
     MUX_uxn_opcodes_h_l433_c32_3697_iffalse <= VAR_MUX_uxn_opcodes_h_l433_c32_3697_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l433_c32_3697_return_output := MUX_uxn_opcodes_h_l433_c32_3697_return_output;

     -- printf_uxn_opcodes_h_l388_c3_6982[uxn_opcodes_h_l388_c3_6982] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l388_c3_6982_uxn_opcodes_h_l388_c3_6982_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l388_c3_6982_uxn_opcodes_h_l388_c3_6982_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l463_c7_33a4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_return_output := result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue := VAR_MUX_uxn_opcodes_h_l433_c32_3697_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_33a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_33a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_33a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_33a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l409_c7_753f_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l424_c7_dfce] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;

     -- t16_MUX[uxn_opcodes_h_l405_c7_10c7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l405_c7_10c7_cond <= VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_cond;
     t16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue;
     t16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output := t16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l458_c7_82d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_return_output;

     -- n16_MUX[uxn_opcodes_h_l424_c7_dfce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l424_c7_dfce_cond <= VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_cond;
     n16_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue;
     n16_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_return_output := n16_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l428_c7_3fc0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l424_c7_dfce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l458_c7_82d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l458_c7_82d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c7_82d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse := VAR_n16_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_82d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_82d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_82d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_82d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse := VAR_t16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l453_c7_f6f0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output := result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l424_c7_dfce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l453_c7_f6f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l418_c7_6b83] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l418_c7_6b83_cond <= VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_cond;
     n16_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue;
     n16_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_return_output := n16_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l453_c7_f6f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output;

     -- t16_MUX[uxn_opcodes_h_l399_c7_0d43] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l399_c7_0d43_cond <= VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_cond;
     t16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue;
     t16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output := t16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l453_c7_f6f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l418_c7_6b83] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l418_c7_6b83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_f6f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;
     -- n16_MUX[uxn_opcodes_h_l414_c7_0ffc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l414_c7_0ffc_cond <= VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_cond;
     n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue;
     n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output := n16_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l448_c7_aaac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_return_output := result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_return_output;

     -- t16_MUX[uxn_opcodes_h_l395_c7_e29a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l395_c7_e29a_cond <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_cond;
     t16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue;
     t16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output := t16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l414_c7_0ffc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l448_c7_aaac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l418_c7_6b83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l414_c7_0ffc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l448_c7_aaac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l448_c7_aaac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_aaac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_aaac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_aaac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_aaac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse := VAR_t16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l409_c7_753f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l414_c7_0ffc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;

     -- t16_MUX[uxn_opcodes_h_l387_c2_be36] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l387_c2_be36_cond <= VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_cond;
     t16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue;
     t16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_return_output := t16_MUX_uxn_opcodes_h_l387_c2_be36_return_output;

     -- n16_MUX[uxn_opcodes_h_l409_c7_753f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l409_c7_753f_cond <= VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_cond;
     n16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_iftrue;
     n16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_return_output := n16_MUX_uxn_opcodes_h_l409_c7_753f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l443_c7_da82] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l443_c7_da82] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l443_c7_da82] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_cond;
     result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_return_output := result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l443_c7_da82] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l409_c7_753f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l409_c7_753f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_da82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_753f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_da82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_da82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_da82_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l387_c2_be36_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l435_c7_c5b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l409_c7_753f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output;

     -- n16_MUX[uxn_opcodes_h_l405_c7_10c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l405_c7_10c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_cond;
     n16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue;
     n16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output := n16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l435_c7_c5b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l405_c7_10c7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l405_c7_10c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c7_c5b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l435_c7_c5b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse := VAR_n16_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_753f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c5b7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l428_c7_3fc0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output := result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l428_c7_3fc0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_0d43] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l428_c7_3fc0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l405_c7_10c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l399_c7_0d43] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l399_c7_0d43_cond <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_cond;
     n16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue;
     n16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output := n16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l428_c7_3fc0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_0d43] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_3fc0_return_output;
     -- n16_MUX[uxn_opcodes_h_l395_c7_e29a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l395_c7_e29a_cond <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_cond;
     n16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue;
     n16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output := n16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_e29a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l424_c7_dfce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l424_c7_dfce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_0d43] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_e29a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c7_dfce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l424_c7_dfce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_return_output := result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse := VAR_n16_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_dfce_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l387_c2_be36] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l418_c7_6b83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_e29a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;

     -- n16_MUX[uxn_opcodes_h_l387_c2_be36] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l387_c2_be36_cond <= VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_cond;
     n16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_iftrue;
     n16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_return_output := n16_MUX_uxn_opcodes_h_l387_c2_be36_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c2_be36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l418_c7_6b83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l418_c7_6b83] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_cond;
     result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_return_output := result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l418_c7_6b83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l387_c2_be36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_6b83_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c7_0ffc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l414_c7_0ffc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l414_c7_0ffc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c2_be36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l414_c7_0ffc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output := result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_0ffc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l409_c7_753f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l409_c7_753f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l409_c7_753f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l409_c7_753f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_return_output := result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_753f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_753f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_753f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_753f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l405_c7_10c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l405_c7_10c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l405_c7_10c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l405_c7_10c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_10c7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l399_c7_0d43] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_cond;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_return_output := result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_0d43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_0d43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_0d43] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_0d43_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_e29a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_e29a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_e29a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l395_c7_e29a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_return_output := result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_e29a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l387_c2_be36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l387_c2_be36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c2_be36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l387_c2_be36] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_cond;
     result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_return_output := result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l475_l383_DUPLICATE_7c39 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l475_l383_DUPLICATE_7c39_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_be36_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_be36_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l475_l383_DUPLICATE_7c39_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l475_l383_DUPLICATE_7c39_return_output;
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
