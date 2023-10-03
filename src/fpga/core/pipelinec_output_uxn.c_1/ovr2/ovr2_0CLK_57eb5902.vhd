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
-- BIN_OP_EQ[uxn_opcodes_h_l387_c6_58ec]
signal BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l387_c1_7232]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l387_c2_f166]
signal n16_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l387_c2_f166]
signal t16_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l387_c2_f166]
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l387_c2_f166]
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l387_c2_f166]
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l387_c2_f166]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c2_f166]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l387_c2_f166]
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c2_f166]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c2_f166]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l388_c3_c11d[uxn_opcodes_h_l388_c3_c11d]
signal printf_uxn_opcodes_h_l388_c3_c11d_uxn_opcodes_h_l388_c3_c11d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l395_c11_9a43]
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l395_c7_0f42]
signal n16_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l395_c7_0f42]
signal t16_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_0f42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_0f42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_0f42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_0f42]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l395_c7_0f42]
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_0f42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_0f42]
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l399_c11_4255]
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l399_c7_91c2]
signal n16_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l399_c7_91c2]
signal t16_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_91c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_91c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_91c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_91c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l399_c7_91c2]
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_91c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_91c2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l405_c11_5a5e]
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l405_c7_c085]
signal n16_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l405_c7_c085]
signal t16_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l405_c7_c085]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l405_c7_c085]
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l405_c7_c085]
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l405_c7_c085]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l405_c7_c085]
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l405_c7_c085]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l405_c7_c085]
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l409_c11_1a32]
signal BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l409_c7_da02]
signal n16_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l409_c7_da02]
signal t16_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l409_c7_da02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l409_c7_da02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l409_c7_da02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l409_c7_da02]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l409_c7_da02]
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l409_c7_da02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l409_c7_da02]
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l410_c3_a235]
signal BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l414_c11_5aa2]
signal BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l414_c7_b0c2]
signal n16_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c7_b0c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l414_c7_b0c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l414_c7_b0c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l414_c7_b0c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l414_c7_b0c2]
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l414_c7_b0c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l414_c7_b0c2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l418_c11_33ab]
signal BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l418_c7_aa54]
signal n16_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l418_c7_aa54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l418_c7_aa54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l418_c7_aa54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l418_c7_aa54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l418_c7_aa54]
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l418_c7_aa54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l418_c7_aa54]
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l424_c11_bc66]
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l424_c7_0279]
signal n16_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c7_0279]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l424_c7_0279]
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l424_c7_0279]
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l424_c7_0279]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l424_c7_0279]
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l424_c7_0279]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l424_c7_0279]
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l428_c11_60de]
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l428_c7_fd7c]
signal n16_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l428_c7_fd7c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l428_c7_fd7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l428_c7_fd7c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l428_c7_fd7c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l428_c7_fd7c]
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l428_c7_fd7c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l428_c7_fd7c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l429_c3_15ca]
signal BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l433_c32_9101]
signal BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l433_c32_3446]
signal BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l433_c32_ad1c]
signal MUX_uxn_opcodes_h_l433_c32_ad1c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l433_c32_ad1c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l433_c32_ad1c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l433_c32_ad1c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l435_c11_aa67]
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c7_4a99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l435_c7_4a99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l435_c7_4a99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c7_4a99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l435_c7_4a99]
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c7_4a99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l435_c7_4a99]
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l443_c11_1be7]
signal BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l443_c7_b01e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l443_c7_b01e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l443_c7_b01e]
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l443_c7_b01e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l448_c11_74d2]
signal BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l448_c7_0cda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l448_c7_0cda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l448_c7_0cda]
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l448_c7_0cda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l453_c11_2e00]
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l453_c7_2047]
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l453_c7_2047]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l453_c7_2047]
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l453_c7_2047]
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l456_c34_0b14]
signal CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l458_c11_0a11]
signal BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l458_c7_adbb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c7_adbb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l458_c7_adbb]
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l458_c7_adbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l463_c11_532e]
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l463_c7_aafb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l463_c7_aafb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l463_c7_aafb]
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l463_c7_aafb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l468_c11_0ad8]
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l468_c7_81ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l468_c7_81ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l468_c7_81ac]
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l468_c7_81ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_49dd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec
BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_left,
BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_right,
BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_return_output);

-- n16_MUX_uxn_opcodes_h_l387_c2_f166
n16_MUX_uxn_opcodes_h_l387_c2_f166 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l387_c2_f166_cond,
n16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue,
n16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse,
n16_MUX_uxn_opcodes_h_l387_c2_f166_return_output);

-- t16_MUX_uxn_opcodes_h_l387_c2_f166
t16_MUX_uxn_opcodes_h_l387_c2_f166 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l387_c2_f166_cond,
t16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue,
t16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse,
t16_MUX_uxn_opcodes_h_l387_c2_f166_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166
result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_cond,
result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output);

-- printf_uxn_opcodes_h_l388_c3_c11d_uxn_opcodes_h_l388_c3_c11d
printf_uxn_opcodes_h_l388_c3_c11d_uxn_opcodes_h_l388_c3_c11d : entity work.printf_uxn_opcodes_h_l388_c3_c11d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l388_c3_c11d_uxn_opcodes_h_l388_c3_c11d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43
BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_left,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_right,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output);

-- n16_MUX_uxn_opcodes_h_l395_c7_0f42
n16_MUX_uxn_opcodes_h_l395_c7_0f42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l395_c7_0f42_cond,
n16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue,
n16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse,
n16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output);

-- t16_MUX_uxn_opcodes_h_l395_c7_0f42
t16_MUX_uxn_opcodes_h_l395_c7_0f42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l395_c7_0f42_cond,
t16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue,
t16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse,
t16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42
result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_cond,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_left,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_right,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output);

-- n16_MUX_uxn_opcodes_h_l399_c7_91c2
n16_MUX_uxn_opcodes_h_l399_c7_91c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l399_c7_91c2_cond,
n16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue,
n16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse,
n16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output);

-- t16_MUX_uxn_opcodes_h_l399_c7_91c2
t16_MUX_uxn_opcodes_h_l399_c7_91c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l399_c7_91c2_cond,
t16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue,
t16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse,
t16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2
result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e
BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_left,
BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_right,
BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output);

-- n16_MUX_uxn_opcodes_h_l405_c7_c085
n16_MUX_uxn_opcodes_h_l405_c7_c085 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l405_c7_c085_cond,
n16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue,
n16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse,
n16_MUX_uxn_opcodes_h_l405_c7_c085_return_output);

-- t16_MUX_uxn_opcodes_h_l405_c7_c085
t16_MUX_uxn_opcodes_h_l405_c7_c085 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l405_c7_c085_cond,
t16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue,
t16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse,
t16_MUX_uxn_opcodes_h_l405_c7_c085_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085
result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_cond,
result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32
BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_left,
BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_right,
BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output);

-- n16_MUX_uxn_opcodes_h_l409_c7_da02
n16_MUX_uxn_opcodes_h_l409_c7_da02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l409_c7_da02_cond,
n16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue,
n16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse,
n16_MUX_uxn_opcodes_h_l409_c7_da02_return_output);

-- t16_MUX_uxn_opcodes_h_l409_c7_da02
t16_MUX_uxn_opcodes_h_l409_c7_da02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l409_c7_da02_cond,
t16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue,
t16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse,
t16_MUX_uxn_opcodes_h_l409_c7_da02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02
result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_cond,
result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l410_c3_a235
BIN_OP_OR_uxn_opcodes_h_l410_c3_a235 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_left,
BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_right,
BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2
BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_left,
BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_right,
BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output);

-- n16_MUX_uxn_opcodes_h_l414_c7_b0c2
n16_MUX_uxn_opcodes_h_l414_c7_b0c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l414_c7_b0c2_cond,
n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue,
n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse,
n16_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2
result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab
BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_left,
BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_right,
BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output);

-- n16_MUX_uxn_opcodes_h_l418_c7_aa54
n16_MUX_uxn_opcodes_h_l418_c7_aa54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l418_c7_aa54_cond,
n16_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue,
n16_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse,
n16_MUX_uxn_opcodes_h_l418_c7_aa54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54
result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_cond,
result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66
BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_left,
BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_right,
BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output);

-- n16_MUX_uxn_opcodes_h_l424_c7_0279
n16_MUX_uxn_opcodes_h_l424_c7_0279 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l424_c7_0279_cond,
n16_MUX_uxn_opcodes_h_l424_c7_0279_iftrue,
n16_MUX_uxn_opcodes_h_l424_c7_0279_iffalse,
n16_MUX_uxn_opcodes_h_l424_c7_0279_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279
result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_cond,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de
BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_left,
BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_right,
BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output);

-- n16_MUX_uxn_opcodes_h_l428_c7_fd7c
n16_MUX_uxn_opcodes_h_l428_c7_fd7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l428_c7_fd7c_cond,
n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue,
n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse,
n16_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c
result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_cond,
result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca
BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_left,
BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_right,
BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l433_c32_9101
BIN_OP_AND_uxn_opcodes_h_l433_c32_9101 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_left,
BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_right,
BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l433_c32_3446
BIN_OP_GT_uxn_opcodes_h_l433_c32_3446 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_left,
BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_right,
BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_return_output);

-- MUX_uxn_opcodes_h_l433_c32_ad1c
MUX_uxn_opcodes_h_l433_c32_ad1c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l433_c32_ad1c_cond,
MUX_uxn_opcodes_h_l433_c32_ad1c_iftrue,
MUX_uxn_opcodes_h_l433_c32_ad1c_iffalse,
MUX_uxn_opcodes_h_l433_c32_ad1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67
BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_left,
BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_right,
BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99
result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_cond,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7
BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_left,
BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_right,
BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e
result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_cond,
result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2
BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_left,
BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_right,
BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda
result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_cond,
result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00
BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_left,
BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_right,
BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047
result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_cond,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_return_output);

-- CONST_SR_8_uxn_opcodes_h_l456_c34_0b14
CONST_SR_8_uxn_opcodes_h_l456_c34_0b14 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_x,
CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11
BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_left,
BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_right,
BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb
result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_cond,
result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e
BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_left,
BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_right,
BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb
result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_cond,
result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8
BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_left,
BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_right,
BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac
result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_cond,
result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5
CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572
CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_return_output,
 n16_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
 t16_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output,
 n16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output,
 t16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output,
 n16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output,
 t16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output,
 n16_MUX_uxn_opcodes_h_l405_c7_c085_return_output,
 t16_MUX_uxn_opcodes_h_l405_c7_c085_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output,
 n16_MUX_uxn_opcodes_h_l409_c7_da02_return_output,
 t16_MUX_uxn_opcodes_h_l409_c7_da02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_return_output,
 BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output,
 n16_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output,
 n16_MUX_uxn_opcodes_h_l418_c7_aa54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output,
 n16_MUX_uxn_opcodes_h_l424_c7_0279_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output,
 n16_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_return_output,
 BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_return_output,
 BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_return_output,
 MUX_uxn_opcodes_h_l433_c32_ad1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_return_output,
 CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_78eb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l388_c3_c11d_uxn_opcodes_h_l388_c3_c11d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_3d8e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_1f3b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_3097 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l412_c3_f280 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c3_f227 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_a077 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l426_c3_50d3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_dbae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l440_c3_ea6d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l437_c3_2ffe : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l435_c7_4a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l445_c3_a9f7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l450_c3_5fbc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l451_c24_51a8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_a25c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l456_c24_06af_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_e198 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_db89 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_95c1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_81ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l471_c3_8f6b : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l419_l410_l429_DUPLICATE_7ad2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_2d99_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_3d3f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l383_l475_DUPLICATE_d6ec_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_right := to_unsigned(15, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c3_f227 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c3_f227;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_right := to_unsigned(14, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_right := to_unsigned(128, 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l437_c3_2ffe := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l437_c3_2ffe;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l450_c3_5fbc := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l450_c3_5fbc;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iftrue := to_unsigned(1, 1);
     VAR_result_stack_value_uxn_opcodes_h_l471_c3_8f6b := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue := VAR_result_stack_value_uxn_opcodes_h_l471_c3_8f6b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_a077 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_a077;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_78eb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_78eb;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l440_c3_ea6d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l440_c3_ea6d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l426_c3_50d3 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l426_c3_50d3;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_1f3b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_1f3b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l412_c3_f280 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l412_c3_f280;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_dbae := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_dbae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_e198 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_e198;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_db89 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_db89;
     VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_right := to_unsigned(10, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_3d8e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_3d8e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_95c1 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_95c1;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_right := to_unsigned(13, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_3097 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_3097;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l445_c3_a9f7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l445_c3_a9f7;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_a25c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_a25c;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse := t16;
     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l419_l410_l429_DUPLICATE_7ad2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l419_l410_l429_DUPLICATE_7ad2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l399_c11_4255] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_left;
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output := BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l387_c2_f166] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l387_c2_f166_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_2d99 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_2d99_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_SR_8[uxn_opcodes_h_l456_c34_0b14] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_x <= VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_return_output := CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l395_c11_9a43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_left;
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output := BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l468_c7_81ac] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_81ac_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l424_c11_bc66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_left;
     BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output := BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l448_c11_74d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l458_c11_0a11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_left;
     BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_return_output := BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l435_c11_aa67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_left;
     BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output := BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l468_c11_0ad8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_left;
     BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_return_output := BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l387_c6_58ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l418_c11_33ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l435_c7_4a99] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l435_c7_4a99_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l463_c11_532e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_left;
     BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_return_output := BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l453_c11_2e00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_left;
     BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_return_output := BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l451_c24_51a8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l451_c24_51a8_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l405_c11_5a5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l414_c11_5aa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_left;
     BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output := BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l428_c11_60de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_left;
     BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output := BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l409_c11_1a32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_left;
     BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output := BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l443_c11_1be7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_left;
     BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_return_output := BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l433_c32_9101] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_left;
     BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_return_output := BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_left := VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_9101_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_58ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_9a43_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_4255_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_5a5e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_1a32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_5aa2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_33ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_bc66_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_60de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_aa67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_1be7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_74d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_2e00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_0a11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_532e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_0ad8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l419_l410_l429_DUPLICATE_7ad2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l419_l410_l429_DUPLICATE_7ad2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l419_l410_l429_DUPLICATE_7ad2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l451_c24_51a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_2d99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_2d99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_9ed9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0c82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_65f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_0400_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_d09e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l387_c2_f166_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l435_c7_4a99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_81ac_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l468_c7_81ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l468_c7_81ac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_return_output := result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l410_c3_a235] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_left;
     BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_return_output := BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l468_c7_81ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c7_4a99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l433_c32_3446] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_left;
     BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_return_output := BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c7_4a99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l456_c24_06af] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l456_c24_06af_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_0b14_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l387_c2_f166] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l429_c3_15ca] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_left;
     BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_return_output := BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l435_c7_4a99] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l387_c1_7232] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_3d3f LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_3d3f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_7572_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l468_c7_81ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_3446_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_a235_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_15ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l456_c24_06af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_3d3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_3d3f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_11e5_return_output;
     VAR_printf_uxn_opcodes_h_l388_c3_c11d_uxn_opcodes_h_l388_c3_c11d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_7232_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_81ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_81ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_81ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_81ac_return_output;
     -- n16_MUX[uxn_opcodes_h_l428_c7_fd7c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l428_c7_fd7c_cond <= VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_cond;
     n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue;
     n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output := n16_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l428_c7_fd7c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;

     -- MUX[uxn_opcodes_h_l433_c32_ad1c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l433_c32_ad1c_cond <= VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_cond;
     MUX_uxn_opcodes_h_l433_c32_ad1c_iftrue <= VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_iftrue;
     MUX_uxn_opcodes_h_l433_c32_ad1c_iffalse <= VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_return_output := MUX_uxn_opcodes_h_l433_c32_ad1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l463_c7_aafb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l428_c7_fd7c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l463_c7_aafb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l463_c7_aafb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_return_output := result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l463_c7_aafb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_return_output;

     -- printf_uxn_opcodes_h_l388_c3_c11d[uxn_opcodes_h_l388_c3_c11d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l388_c3_c11d_uxn_opcodes_h_l388_c3_c11d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l388_c3_c11d_uxn_opcodes_h_l388_c3_c11d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l409_c7_da02] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l409_c7_da02_cond <= VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_cond;
     t16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue;
     t16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_return_output := t16_MUX_uxn_opcodes_h_l409_c7_da02_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue := VAR_MUX_uxn_opcodes_h_l433_c32_ad1c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_iffalse := VAR_n16_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_aafb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_aafb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_aafb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_aafb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse := VAR_t16_MUX_uxn_opcodes_h_l409_c7_da02_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l424_c7_0279] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c7_adbb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l458_c7_adbb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_return_output := result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l424_c7_0279] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output;

     -- n16_MUX[uxn_opcodes_h_l424_c7_0279] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l424_c7_0279_cond <= VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_cond;
     n16_MUX_uxn_opcodes_h_l424_c7_0279_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_iftrue;
     n16_MUX_uxn_opcodes_h_l424_c7_0279_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_return_output := n16_MUX_uxn_opcodes_h_l424_c7_0279_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l428_c7_fd7c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l458_c7_adbb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_return_output;

     -- t16_MUX[uxn_opcodes_h_l405_c7_c085] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l405_c7_c085_cond <= VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_cond;
     t16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue;
     t16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_return_output := t16_MUX_uxn_opcodes_h_l405_c7_c085_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l458_c7_adbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse := VAR_n16_MUX_uxn_opcodes_h_l424_c7_0279_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_adbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_0279_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_adbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_adbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_adbb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l405_c7_c085_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l453_c7_2047] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l453_c7_2047] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_return_output;

     -- t16_MUX[uxn_opcodes_h_l399_c7_91c2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l399_c7_91c2_cond <= VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_cond;
     t16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue;
     t16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output := t16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;

     -- n16_MUX[uxn_opcodes_h_l418_c7_aa54] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l418_c7_aa54_cond <= VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_cond;
     n16_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue;
     n16_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_return_output := n16_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l453_c7_2047] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_cond;
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_return_output := result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l424_c7_0279] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l418_c7_aa54] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l418_c7_aa54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l453_c7_2047] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_2047_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_2047_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_0279_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_2047_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_2047_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse := VAR_t16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;
     -- n16_MUX[uxn_opcodes_h_l414_c7_b0c2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l414_c7_b0c2_cond <= VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_cond;
     n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue;
     n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output := n16_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l448_c7_0cda] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_cond;
     result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_return_output := result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l448_c7_0cda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l448_c7_0cda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l414_c7_b0c2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l448_c7_0cda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l414_c7_b0c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l418_c7_aa54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;

     -- t16_MUX[uxn_opcodes_h_l395_c7_0f42] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l395_c7_0f42_cond <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_cond;
     t16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue;
     t16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output := t16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse := VAR_n16_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_0cda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_0cda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_0cda_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_0cda_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse := VAR_t16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l414_c7_b0c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;

     -- t16_MUX[uxn_opcodes_h_l387_c2_f166] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l387_c2_f166_cond <= VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_cond;
     t16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue;
     t16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_return_output := t16_MUX_uxn_opcodes_h_l387_c2_f166_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l443_c7_b01e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l409_c7_da02] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l443_c7_b01e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_return_output;

     -- n16_MUX[uxn_opcodes_h_l409_c7_da02] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l409_c7_da02_cond <= VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_cond;
     n16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_iftrue;
     n16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_return_output := n16_MUX_uxn_opcodes_h_l409_c7_da02_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l409_c7_da02] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l443_c7_b01e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_return_output := result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l443_c7_b01e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse := VAR_n16_MUX_uxn_opcodes_h_l409_c7_da02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_b01e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_da02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_b01e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_b01e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_b01e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l387_c2_f166_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l435_c7_4a99] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_cond;
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_return_output := result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l409_c7_da02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l405_c7_c085] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c7_4a99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;

     -- n16_MUX[uxn_opcodes_h_l405_c7_c085] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l405_c7_c085_cond <= VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_cond;
     n16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_iftrue;
     n16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_return_output := n16_MUX_uxn_opcodes_h_l405_c7_c085_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l435_c7_4a99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l405_c7_c085] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l435_c7_4a99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l405_c7_c085_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_c085_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_da02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_4a99_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l405_c7_c085] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_91c2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l428_c7_fd7c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_91c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;

     -- n16_MUX[uxn_opcodes_h_l399_c7_91c2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l399_c7_91c2_cond <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_cond;
     n16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue;
     n16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output := n16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l428_c7_fd7c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l428_c7_fd7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l428_c7_fd7c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output := result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse := VAR_n16_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_c085_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_fd7c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_0f42] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c7_0279] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l424_c7_0279] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l424_c7_0279] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_cond;
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_return_output := result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l424_c7_0279] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_91c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_0f42] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;

     -- n16_MUX[uxn_opcodes_h_l395_c7_0f42] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l395_c7_0f42_cond <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_cond;
     n16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue;
     n16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output := n16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse := VAR_n16_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_0279_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_0279_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_0279_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_0279_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l418_c7_aa54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l418_c7_aa54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;

     -- n16_MUX[uxn_opcodes_h_l387_c2_f166] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l387_c2_f166_cond <= VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_cond;
     n16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_iftrue;
     n16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_return_output := n16_MUX_uxn_opcodes_h_l387_c2_f166_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l418_c7_aa54] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_cond;
     result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_return_output := result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_0f42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c2_f166] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l387_c2_f166] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l418_c7_aa54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l387_c2_f166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_aa54_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l414_c7_b0c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c7_b0c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l414_c7_b0c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c2_f166] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l414_c7_b0c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_b0c2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l409_c7_da02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l409_c7_da02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l409_c7_da02] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_cond;
     result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_return_output := result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l409_c7_da02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_da02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_da02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_da02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_da02_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l405_c7_c085] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_cond;
     result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_return_output := result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l405_c7_c085] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l405_c7_c085] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l405_c7_c085] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_c085_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_c085_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_c085_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_c085_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_91c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l399_c7_91c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_91c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_91c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_91c2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_0f42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_0f42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_0f42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l395_c7_0f42] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_cond;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_return_output := result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_0f42_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c2_f166] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l387_c2_f166] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l387_c2_f166] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_cond;
     result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_return_output := result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l387_c2_f166] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l383_l475_DUPLICATE_d6ec LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l383_l475_DUPLICATE_d6ec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_f166_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_f166_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l383_l475_DUPLICATE_d6ec_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l383_l475_DUPLICATE_d6ec_return_output;
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
