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
-- BIN_OP_EQ[uxn_opcodes_h_l387_c6_497f]
signal BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l387_c1_6b7e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l387_c2_0391]
signal t16_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l387_c2_0391]
signal n16_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c2_0391]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c2_0391]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l387_c2_0391]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l387_c2_0391]
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c2_0391]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l387_c2_0391]
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l387_c2_0391]
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l387_c2_0391]
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l388_c3_e3db[uxn_opcodes_h_l388_c3_e3db]
signal printf_uxn_opcodes_h_l388_c3_e3db_uxn_opcodes_h_l388_c3_e3db_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l395_c11_f6b5]
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l395_c7_b343]
signal t16_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l395_c7_b343]
signal n16_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_b343]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_b343]
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_b343]
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_b343]
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_b343]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_b343]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l395_c7_b343]
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l399_c11_f128]
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l399_c7_30d1]
signal t16_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l399_c7_30d1]
signal n16_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_30d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_30d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_30d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_30d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_30d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_30d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l399_c7_30d1]
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l405_c11_91f8]
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l405_c7_3a26]
signal t16_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l405_c7_3a26]
signal n16_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l405_c7_3a26]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l405_c7_3a26]
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l405_c7_3a26]
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l405_c7_3a26]
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l405_c7_3a26]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l405_c7_3a26]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l405_c7_3a26]
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l409_c11_8842]
signal BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l409_c7_430d]
signal t16_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l409_c7_430d]
signal n16_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l409_c7_430d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l409_c7_430d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l409_c7_430d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l409_c7_430d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l409_c7_430d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l409_c7_430d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l409_c7_430d]
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l410_c3_d742]
signal BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l414_c11_b272]
signal BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l414_c7_8f3f]
signal n16_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l414_c7_8f3f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l414_c7_8f3f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l414_c7_8f3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l414_c7_8f3f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l414_c7_8f3f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c7_8f3f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l414_c7_8f3f]
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l418_c11_650f]
signal BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l418_c7_b167]
signal n16_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l418_c7_b167]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l418_c7_b167]
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l418_c7_b167]
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l418_c7_b167]
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l418_c7_b167]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l418_c7_b167]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l418_c7_b167]
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l424_c11_530e]
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l424_c7_86a5]
signal n16_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l424_c7_86a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l424_c7_86a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l424_c7_86a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l424_c7_86a5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l424_c7_86a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c7_86a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l424_c7_86a5]
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l428_c11_ce09]
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l428_c7_b9c6]
signal n16_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l428_c7_b9c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l428_c7_b9c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l428_c7_b9c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l428_c7_b9c6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l428_c7_b9c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l428_c7_b9c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l428_c7_b9c6]
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l429_c3_1983]
signal BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l433_c32_488c]
signal BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l433_c32_f027]
signal BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l433_c32_4e7f]
signal MUX_uxn_opcodes_h_l433_c32_4e7f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l433_c32_4e7f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l433_c32_4e7f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l433_c32_4e7f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l435_c11_870e]
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c7_c293]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l435_c7_c293]
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l435_c7_c293]
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l435_c7_c293]
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c7_c293]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c7_c293]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l435_c7_c293]
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l443_c11_89e7]
signal BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l443_c7_c8bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l443_c7_c8bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l443_c7_c8bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l443_c7_c8bf]
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l448_c11_caeb]
signal BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l448_c7_2712]
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l448_c7_2712]
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l448_c7_2712]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l448_c7_2712]
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l453_c11_0100]
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l453_c7_4414]
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l453_c7_4414]
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l453_c7_4414]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l453_c7_4414]
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l456_c34_3c1c]
signal CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l458_c11_ab6f]
signal BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l458_c7_23af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l458_c7_23af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c7_23af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l458_c7_23af]
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l463_c11_548b]
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l463_c7_976c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l463_c7_976c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l463_c7_976c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l463_c7_976c]
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l468_c11_835e]
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l468_c7_7486]
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l468_c7_7486]
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l468_c7_7486]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l468_c7_7486]
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f
BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_left,
BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_right,
BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_return_output);

-- t16_MUX_uxn_opcodes_h_l387_c2_0391
t16_MUX_uxn_opcodes_h_l387_c2_0391 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l387_c2_0391_cond,
t16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue,
t16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse,
t16_MUX_uxn_opcodes_h_l387_c2_0391_return_output);

-- n16_MUX_uxn_opcodes_h_l387_c2_0391
n16_MUX_uxn_opcodes_h_l387_c2_0391 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l387_c2_0391_cond,
n16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue,
n16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse,
n16_MUX_uxn_opcodes_h_l387_c2_0391_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391
result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_cond,
result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_return_output);

-- printf_uxn_opcodes_h_l388_c3_e3db_uxn_opcodes_h_l388_c3_e3db
printf_uxn_opcodes_h_l388_c3_e3db_uxn_opcodes_h_l388_c3_e3db : entity work.printf_uxn_opcodes_h_l388_c3_e3db_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l388_c3_e3db_uxn_opcodes_h_l388_c3_e3db_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5
BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_left,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_right,
BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output);

-- t16_MUX_uxn_opcodes_h_l395_c7_b343
t16_MUX_uxn_opcodes_h_l395_c7_b343 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l395_c7_b343_cond,
t16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue,
t16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse,
t16_MUX_uxn_opcodes_h_l395_c7_b343_return_output);

-- n16_MUX_uxn_opcodes_h_l395_c7_b343
n16_MUX_uxn_opcodes_h_l395_c7_b343 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l395_c7_b343_cond,
n16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue,
n16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse,
n16_MUX_uxn_opcodes_h_l395_c7_b343_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343
result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_cond,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128
BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_left,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_right,
BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output);

-- t16_MUX_uxn_opcodes_h_l399_c7_30d1
t16_MUX_uxn_opcodes_h_l399_c7_30d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l399_c7_30d1_cond,
t16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue,
t16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse,
t16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output);

-- n16_MUX_uxn_opcodes_h_l399_c7_30d1
n16_MUX_uxn_opcodes_h_l399_c7_30d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l399_c7_30d1_cond,
n16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue,
n16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse,
n16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1
result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8
BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_left,
BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_right,
BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output);

-- t16_MUX_uxn_opcodes_h_l405_c7_3a26
t16_MUX_uxn_opcodes_h_l405_c7_3a26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l405_c7_3a26_cond,
t16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue,
t16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse,
t16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output);

-- n16_MUX_uxn_opcodes_h_l405_c7_3a26
n16_MUX_uxn_opcodes_h_l405_c7_3a26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l405_c7_3a26_cond,
n16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue,
n16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse,
n16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26
result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_cond,
result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842
BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_left,
BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_right,
BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output);

-- t16_MUX_uxn_opcodes_h_l409_c7_430d
t16_MUX_uxn_opcodes_h_l409_c7_430d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l409_c7_430d_cond,
t16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue,
t16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse,
t16_MUX_uxn_opcodes_h_l409_c7_430d_return_output);

-- n16_MUX_uxn_opcodes_h_l409_c7_430d
n16_MUX_uxn_opcodes_h_l409_c7_430d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l409_c7_430d_cond,
n16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue,
n16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse,
n16_MUX_uxn_opcodes_h_l409_c7_430d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d
result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_cond,
result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l410_c3_d742
BIN_OP_OR_uxn_opcodes_h_l410_c3_d742 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_left,
BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_right,
BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272
BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_left,
BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_right,
BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output);

-- n16_MUX_uxn_opcodes_h_l414_c7_8f3f
n16_MUX_uxn_opcodes_h_l414_c7_8f3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l414_c7_8f3f_cond,
n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue,
n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse,
n16_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f
result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_cond,
result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f
BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_left,
BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_right,
BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output);

-- n16_MUX_uxn_opcodes_h_l418_c7_b167
n16_MUX_uxn_opcodes_h_l418_c7_b167 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l418_c7_b167_cond,
n16_MUX_uxn_opcodes_h_l418_c7_b167_iftrue,
n16_MUX_uxn_opcodes_h_l418_c7_b167_iffalse,
n16_MUX_uxn_opcodes_h_l418_c7_b167_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167
result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_cond,
result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e
BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_left,
BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_right,
BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output);

-- n16_MUX_uxn_opcodes_h_l424_c7_86a5
n16_MUX_uxn_opcodes_h_l424_c7_86a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l424_c7_86a5_cond,
n16_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue,
n16_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse,
n16_MUX_uxn_opcodes_h_l424_c7_86a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5
result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_cond,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09
BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_left,
BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_right,
BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output);

-- n16_MUX_uxn_opcodes_h_l428_c7_b9c6
n16_MUX_uxn_opcodes_h_l428_c7_b9c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l428_c7_b9c6_cond,
n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue,
n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse,
n16_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6
result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l429_c3_1983
BIN_OP_OR_uxn_opcodes_h_l429_c3_1983 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_left,
BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_right,
BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l433_c32_488c
BIN_OP_AND_uxn_opcodes_h_l433_c32_488c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_left,
BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_right,
BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l433_c32_f027
BIN_OP_GT_uxn_opcodes_h_l433_c32_f027 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_left,
BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_right,
BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_return_output);

-- MUX_uxn_opcodes_h_l433_c32_4e7f
MUX_uxn_opcodes_h_l433_c32_4e7f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l433_c32_4e7f_cond,
MUX_uxn_opcodes_h_l433_c32_4e7f_iftrue,
MUX_uxn_opcodes_h_l433_c32_4e7f_iffalse,
MUX_uxn_opcodes_h_l433_c32_4e7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e
BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_left,
BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_right,
BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293
result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_cond,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7
BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_left,
BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_right,
BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf
result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_cond,
result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb
BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_left,
BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_right,
BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712
result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_cond,
result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100
BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_left,
BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_right,
BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414
result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_cond,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_return_output);

-- CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c
CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_x,
CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f
BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_left,
BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_right,
BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af
result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_cond,
result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b
BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_left,
BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_right,
BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c
result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_cond,
result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e
BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_left,
BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_right,
BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486
result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_cond,
result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e
CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5
CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_return_output,
 t16_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
 n16_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output,
 t16_MUX_uxn_opcodes_h_l395_c7_b343_return_output,
 n16_MUX_uxn_opcodes_h_l395_c7_b343_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output,
 t16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output,
 n16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output,
 t16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output,
 n16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output,
 t16_MUX_uxn_opcodes_h_l409_c7_430d_return_output,
 n16_MUX_uxn_opcodes_h_l409_c7_430d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output,
 n16_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output,
 n16_MUX_uxn_opcodes_h_l418_c7_b167_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output,
 n16_MUX_uxn_opcodes_h_l424_c7_86a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output,
 n16_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_return_output,
 BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_return_output,
 MUX_uxn_opcodes_h_l433_c32_4e7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_return_output,
 CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_e752 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l388_c3_e3db_uxn_opcodes_h_l388_c3_e3db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_849d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_854d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_c5f8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l412_c3_d0bd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c3_a5eb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_3af6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l426_c3_ad0b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_5cbb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l435_c7_c293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l437_c3_f109 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l440_c3_1737 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l445_c3_a44b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l450_c3_3eec : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l451_c24_0508_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_9bd6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l456_c24_fbd1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_cfe6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_d6a2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_ad8c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_7486_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l471_c3_8cdd : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_1fbf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_dd8f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af45_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l383_l475_DUPLICATE_b9d3_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_d6a2 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l465_c3_d6a2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l437_c3_f109 := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l437_c3_f109;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_ad8c := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l470_c3_ad8c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_cfe6 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l460_c3_cfe6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_right := to_unsigned(13, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_right := to_unsigned(11, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_right := to_unsigned(5, 3);
     VAR_result_stack_value_uxn_opcodes_h_l471_c3_8cdd := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iftrue := VAR_result_stack_value_uxn_opcodes_h_l471_c3_8cdd;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l426_c3_ad0b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l426_c3_ad0b;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_3af6 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l422_c3_3af6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l450_c3_3eec := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l450_c3_3eec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_854d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_854d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l445_c3_a44b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l445_c3_a44b;
     VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_right := to_unsigned(14, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_5cbb := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l431_c3_5cbb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_right := to_unsigned(15, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_c5f8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_c5f8;
     VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c3_a5eb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l416_c3_a5eb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_9bd6 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l455_c3_9bd6;
     VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l412_c3_d0bd := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l412_c3_d0bd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_849d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_849d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l440_c3_1737 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l440_c3_1737;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_e752 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_e752;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l448_c11_caeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l387_c6_497f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_left;
     BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output := BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l395_c11_f6b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l433_c32_488c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_left;
     BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_return_output := BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l414_c11_b272] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_left;
     BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output := BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l468_c7_7486] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_7486_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l458_c11_ab6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l409_c11_8842] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_left;
     BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output := BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l456_c34_3c1c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_return_output := CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796_return_output := result.sp_relative_shift;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l435_c7_c293] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l435_c7_c293_return_output := result.is_stack_read;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_dd8f LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_dd8f_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l468_c11_835e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_left;
     BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_return_output := BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l435_c11_870e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_left;
     BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output := BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l428_c11_ce09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_left;
     BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output := BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l443_c11_89e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l387_c2_0391] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l387_c2_0391_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l453_c11_0100] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_left;
     BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_return_output := BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l399_c11_f128] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_left;
     BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output := BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_1fbf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_1fbf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace_return_output := result.is_sp_shift;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l405_c11_91f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l424_c11_530e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_left;
     BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output := BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l463_c11_548b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_left;
     BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_return_output := BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l451_c24_0508] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l451_c24_0508_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l418_c11_650f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_left;
     BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output := BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_left := VAR_BIN_OP_AND_uxn_opcodes_h_l433_c32_488c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l387_c6_497f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l395_c11_f6b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l399_c11_f128_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l405_c11_91f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l409_c11_8842_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l414_c11_b272_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l418_c11_650f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_530e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_ce09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l435_c11_870e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l443_c11_89e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l448_c11_caeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l453_c11_0100_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l458_c11_ab6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l463_c11_548b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_835e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_1fbf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_1fbf_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l400_l410_l419_l429_DUPLICATE_1fbf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l451_c24_0508_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_dd8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l441_l461_DUPLICATE_dd8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_2796_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l418_l453_l414_l448_l409_l443_l405_l435_l468_l399_l428_l463_l395_l424_l458_DUPLICATE_0a85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l418_l414_l409_l405_l435_l399_l395_l424_l387_DUPLICATE_0ace_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_DUPLICATE_2a9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l418_l414_l409_l405_l468_l399_l428_l395_l424_l387_DUPLICATE_33c7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l387_c2_0391_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l435_c7_c293_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_7486_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l387_c2_0391] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l433_c32_f027] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_left;
     BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_return_output := BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l435_c7_c293] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l468_c7_7486] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_cond;
     result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_return_output := result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l435_c7_c293] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l456_c24_fbd1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l456_c24_fbd1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l456_c34_3c1c_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l468_c7_7486] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l429_c3_1983] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_left;
     BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_return_output := BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l410_c3_d742] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_left;
     BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_return_output := BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l468_c7_7486] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af45 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af45_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_0dd5_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l387_c1_6b7e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l435_c7_c293] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l468_c7_7486] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l433_c32_f027_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l410_c3_d742_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l429_c3_1983_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l456_c24_fbd1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l446_l466_DUPLICATE_af45_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l401_l420_DUPLICATE_a62e_return_output;
     VAR_printf_uxn_opcodes_h_l388_c3_e3db_uxn_opcodes_h_l388_c3_e3db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l387_c1_6b7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_7486_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l435_c7_c293_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l468_c7_7486_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l435_c7_c293_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_7486_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l468_c7_7486_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l463_c7_976c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l428_c7_b9c6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;

     -- printf_uxn_opcodes_h_l388_c3_e3db[uxn_opcodes_h_l388_c3_e3db] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l388_c3_e3db_uxn_opcodes_h_l388_c3_e3db_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l388_c3_e3db_uxn_opcodes_h_l388_c3_e3db_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l463_c7_976c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_return_output;

     -- n16_MUX[uxn_opcodes_h_l428_c7_b9c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l428_c7_b9c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_cond;
     n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue;
     n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output := n16_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;

     -- t16_MUX[uxn_opcodes_h_l409_c7_430d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l409_c7_430d_cond <= VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_cond;
     t16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue;
     t16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_return_output := t16_MUX_uxn_opcodes_h_l409_c7_430d_return_output;

     -- MUX[uxn_opcodes_h_l433_c32_4e7f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l433_c32_4e7f_cond <= VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_cond;
     MUX_uxn_opcodes_h_l433_c32_4e7f_iftrue <= VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_iftrue;
     MUX_uxn_opcodes_h_l433_c32_4e7f_iffalse <= VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_return_output := MUX_uxn_opcodes_h_l433_c32_4e7f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l463_c7_976c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_return_output := result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l463_c7_976c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l428_c7_b9c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue := VAR_MUX_uxn_opcodes_h_l433_c32_4e7f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l463_c7_976c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l463_c7_976c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l463_c7_976c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l463_c7_976c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse := VAR_t16_MUX_uxn_opcodes_h_l409_c7_430d_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l424_c7_86a5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;

     -- t16_MUX[uxn_opcodes_h_l405_c7_3a26] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l405_c7_3a26_cond <= VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_cond;
     t16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue;
     t16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output := t16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l458_c7_23af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l458_c7_23af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_return_output;

     -- n16_MUX[uxn_opcodes_h_l424_c7_86a5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l424_c7_86a5_cond <= VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_cond;
     n16_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue;
     n16_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_return_output := n16_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l458_c7_23af] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_cond;
     result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_return_output := result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l424_c7_86a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l458_c7_23af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l428_c7_b9c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_iffalse := VAR_n16_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l458_c7_23af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l458_c7_23af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l458_c7_23af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l458_c7_23af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l424_c7_86a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l418_c7_b167] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_return_output;

     -- t16_MUX[uxn_opcodes_h_l399_c7_30d1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l399_c7_30d1_cond <= VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_cond;
     t16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue;
     t16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output := t16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l453_c7_4414] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l453_c7_4414] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_cond;
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_return_output := result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l418_c7_b167] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l453_c7_4414] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_return_output;

     -- n16_MUX[uxn_opcodes_h_l418_c7_b167] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l418_c7_b167_cond <= VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_cond;
     n16_MUX_uxn_opcodes_h_l418_c7_b167_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_iftrue;
     n16_MUX_uxn_opcodes_h_l418_c7_b167_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_return_output := n16_MUX_uxn_opcodes_h_l418_c7_b167_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l453_c7_4414] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l418_c7_b167_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l453_c7_4414_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l418_c7_b167_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l453_c7_4414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l453_c7_4414_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l453_c7_4414_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse := VAR_t16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;
     -- n16_MUX[uxn_opcodes_h_l414_c7_8f3f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l414_c7_8f3f_cond <= VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_cond;
     n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue;
     n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output := n16_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;

     -- t16_MUX[uxn_opcodes_h_l395_c7_b343] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l395_c7_b343_cond <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_cond;
     t16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue;
     t16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_return_output := t16_MUX_uxn_opcodes_h_l395_c7_b343_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l448_c7_2712] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l418_c7_b167] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l414_c7_8f3f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l448_c7_2712] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l448_c7_2712] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_cond;
     result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_return_output := result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l448_c7_2712] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l414_c7_8f3f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l448_c7_2712_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l448_c7_2712_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l418_c7_b167_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l448_c7_2712_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l448_c7_2712_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse := VAR_t16_MUX_uxn_opcodes_h_l395_c7_b343_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l443_c7_c8bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output;

     -- n16_MUX[uxn_opcodes_h_l409_c7_430d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l409_c7_430d_cond <= VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_cond;
     n16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_iftrue;
     n16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_return_output := n16_MUX_uxn_opcodes_h_l409_c7_430d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l409_c7_430d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l443_c7_c8bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l409_c7_430d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l443_c7_c8bf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output := result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l443_c7_c8bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l414_c7_8f3f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;

     -- t16_MUX[uxn_opcodes_h_l387_c2_0391] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l387_c2_0391_cond <= VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_cond;
     t16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue;
     t16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_return_output := t16_MUX_uxn_opcodes_h_l387_c2_0391_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse := VAR_n16_MUX_uxn_opcodes_h_l409_c7_430d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l409_c7_430d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l443_c7_c8bf_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l387_c2_0391_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l435_c7_c293] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_cond;
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_return_output := result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l405_c7_3a26] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l409_c7_430d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l405_c7_3a26] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l435_c7_c293] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l435_c7_c293] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l435_c7_c293] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_return_output;

     -- n16_MUX[uxn_opcodes_h_l405_c7_3a26] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l405_c7_3a26_cond <= VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_cond;
     n16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue;
     n16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output := n16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l435_c7_c293_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l435_c7_c293_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l409_c7_430d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l435_c7_c293_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l435_c7_c293_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l405_c7_3a26] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l428_c7_b9c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l428_c7_b9c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l399_c7_30d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;

     -- n16_MUX[uxn_opcodes_h_l399_c7_30d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l399_c7_30d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_cond;
     n16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue;
     n16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output := n16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l428_c7_b9c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l428_c7_b9c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l399_c7_30d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse := VAR_n16_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l428_c7_b9c6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l424_c7_86a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l399_c7_30d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;

     -- n16_MUX[uxn_opcodes_h_l395_c7_b343] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l395_c7_b343_cond <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_cond;
     n16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_iftrue;
     n16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_return_output := n16_MUX_uxn_opcodes_h_l395_c7_b343_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l395_c7_b343] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l395_c7_b343] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l424_c7_86a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c7_86a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l424_c7_86a5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_return_output := result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse := VAR_n16_MUX_uxn_opcodes_h_l395_c7_b343_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l395_c7_b343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_86a5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l418_c7_b167] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l418_c7_b167] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_cond;
     result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_return_output := result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l387_c2_0391] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l418_c7_b167] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_return_output;

     -- n16_MUX[uxn_opcodes_h_l387_c2_0391] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l387_c2_0391_cond <= VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_cond;
     n16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_iftrue;
     n16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_return_output := n16_MUX_uxn_opcodes_h_l387_c2_0391_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l395_c7_b343] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l387_c2_0391] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l418_c7_b167] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l387_c2_0391_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l418_c7_b167_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l418_c7_b167_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l395_c7_b343_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l418_c7_b167_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l418_c7_b167_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l387_c2_0391] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l414_c7_8f3f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l414_c7_8f3f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output := result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l414_c7_8f3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l414_c7_8f3f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l414_c7_8f3f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l409_c7_430d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l409_c7_430d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_return_output := result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l409_c7_430d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l409_c7_430d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l409_c7_430d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l409_c7_430d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l409_c7_430d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l409_c7_430d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l405_c7_3a26] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l405_c7_3a26] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_cond;
     result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_return_output := result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l405_c7_3a26] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l405_c7_3a26] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l405_c7_3a26_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l399_c7_30d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l399_c7_30d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l399_c7_30d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l399_c7_30d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l399_c7_30d1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l395_c7_b343] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_cond;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_return_output := result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l395_c7_b343] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l395_c7_b343] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l395_c7_b343] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l395_c7_b343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l395_c7_b343_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l395_c7_b343_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l395_c7_b343_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l387_c2_0391] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l387_c2_0391] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l387_c2_0391] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l387_c2_0391] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_cond;
     result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_return_output := result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l383_l475_DUPLICATE_b9d3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l383_l475_DUPLICATE_b9d3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l387_c2_0391_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l387_c2_0391_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l383_l475_DUPLICATE_b9d3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l383_l475_DUPLICATE_b9d3_return_output;
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
