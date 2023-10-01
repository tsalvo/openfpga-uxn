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
-- Submodules: 108
entity lth2_0CLK_5fcb251d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_5fcb251d;
architecture arch of lth2_0CLK_5fcb251d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1204_c6_d15a]
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1204_c1_2939]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1204_c2_f590]
signal n16_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1204_c2_f590]
signal t16_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1204_c2_f590]
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1204_c2_f590]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1204_c2_f590]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1204_c2_f590]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1204_c2_f590]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1204_c2_f590]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1204_c2_f590]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1204_c2_f590]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1205_c3_efee[uxn_opcodes_h_l1205_c3_efee]
signal printf_uxn_opcodes_h_l1205_c3_efee_uxn_opcodes_h_l1205_c3_efee_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_84f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1212_c7_eb91]
signal n16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1212_c7_eb91]
signal t16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_eb91]
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1212_c7_eb91]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_eb91]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_eb91]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_eb91]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c7_eb91]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_eb91]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1216_c11_5fe8]
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1216_c7_1663]
signal n16_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1216_c7_1663]
signal t16_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1216_c7_1663]
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1216_c7_1663]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1216_c7_1663]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1216_c7_1663]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1216_c7_1663]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1216_c7_1663]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1216_c7_1663]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_f260]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_f240]
signal n16_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1222_c7_f240]
signal t16_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1222_c7_f240]
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1222_c7_f240]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_f240]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1222_c7_f240]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_f240]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_f240]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_f240]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_2be4]
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1226_c7_cabd]
signal n16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1226_c7_cabd]
signal t16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1226_c7_cabd]
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1226_c7_cabd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_cabd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1226_c7_cabd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_cabd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_cabd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_cabd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1227_c3_c07e]
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_7bc9]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1231_c7_da57]
signal n16_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1231_c7_da57]
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1231_c7_da57]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_da57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1231_c7_da57]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_da57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1231_c7_da57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_da57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1235_c11_3a20]
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1235_c7_a745]
signal n16_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1235_c7_a745]
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1235_c7_a745]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1235_c7_a745]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1235_c7_a745]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1235_c7_a745]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1235_c7_a745]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1235_c7_a745]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_c3a8]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1241_c7_ef5f]
signal n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1241_c7_ef5f]
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1241_c7_ef5f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_ef5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_ef5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_ef5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_ef5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_ef5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_1d5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1245_c7_199d]
signal n16_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_199d]
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_199d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_199d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_199d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_199d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_199d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_199d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1246_c3_57fc]
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1249_c32_584d]
signal BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1249_c32_dbf0]
signal BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1249_c32_8cbd]
signal MUX_uxn_opcodes_h_l1249_c32_8cbd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1249_c32_8cbd_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1249_c32_8cbd_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1249_c32_8cbd_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1251_c11_8e1e]
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1251_c7_15c2]
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1251_c7_15c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1251_c7_15c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1251_c7_15c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1251_c7_15c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output : unsigned(7 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1255_c24_ae10]
signal BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1255_c24_57f8]
signal MUX_uxn_opcodes_h_l1255_c24_57f8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1255_c24_57f8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1255_c24_57f8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1255_c24_57f8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_91fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_0f74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_0f74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_left,
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_right,
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_return_output);

-- n16_MUX_uxn_opcodes_h_l1204_c2_f590
n16_MUX_uxn_opcodes_h_l1204_c2_f590 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1204_c2_f590_cond,
n16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue,
n16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse,
n16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output);

-- t16_MUX_uxn_opcodes_h_l1204_c2_f590
t16_MUX_uxn_opcodes_h_l1204_c2_f590 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1204_c2_f590_cond,
t16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue,
t16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse,
t16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_cond,
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_return_output);

-- printf_uxn_opcodes_h_l1205_c3_efee_uxn_opcodes_h_l1205_c3_efee
printf_uxn_opcodes_h_l1205_c3_efee_uxn_opcodes_h_l1205_c3_efee : entity work.printf_uxn_opcodes_h_l1205_c3_efee_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1205_c3_efee_uxn_opcodes_h_l1205_c3_efee_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output);

-- n16_MUX_uxn_opcodes_h_l1212_c7_eb91
n16_MUX_uxn_opcodes_h_l1212_c7_eb91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond,
n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue,
n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse,
n16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output);

-- t16_MUX_uxn_opcodes_h_l1212_c7_eb91
t16_MUX_uxn_opcodes_h_l1212_c7_eb91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond,
t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue,
t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse,
t16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_cond,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_left,
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_right,
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output);

-- n16_MUX_uxn_opcodes_h_l1216_c7_1663
n16_MUX_uxn_opcodes_h_l1216_c7_1663 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1216_c7_1663_cond,
n16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue,
n16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse,
n16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output);

-- t16_MUX_uxn_opcodes_h_l1216_c7_1663
t16_MUX_uxn_opcodes_h_l1216_c7_1663 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1216_c7_1663_cond,
t16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue,
t16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse,
t16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_cond,
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_f240
n16_MUX_uxn_opcodes_h_l1222_c7_f240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_f240_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output);

-- t16_MUX_uxn_opcodes_h_l1222_c7_f240
t16_MUX_uxn_opcodes_h_l1222_c7_f240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1222_c7_f240_cond,
t16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue,
t16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse,
t16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_cond,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_left,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_right,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output);

-- n16_MUX_uxn_opcodes_h_l1226_c7_cabd
n16_MUX_uxn_opcodes_h_l1226_c7_cabd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond,
n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue,
n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse,
n16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output);

-- t16_MUX_uxn_opcodes_h_l1226_c7_cabd
t16_MUX_uxn_opcodes_h_l1226_c7_cabd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond,
t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue,
t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse,
t16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e
BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_left,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_right,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output);

-- n16_MUX_uxn_opcodes_h_l1231_c7_da57
n16_MUX_uxn_opcodes_h_l1231_c7_da57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1231_c7_da57_cond,
n16_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue,
n16_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse,
n16_MUX_uxn_opcodes_h_l1231_c7_da57_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_cond,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_left,
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_right,
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output);

-- n16_MUX_uxn_opcodes_h_l1235_c7_a745
n16_MUX_uxn_opcodes_h_l1235_c7_a745 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1235_c7_a745_cond,
n16_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue,
n16_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse,
n16_MUX_uxn_opcodes_h_l1235_c7_a745_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_cond,
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output);

-- n16_MUX_uxn_opcodes_h_l1241_c7_ef5f
n16_MUX_uxn_opcodes_h_l1241_c7_ef5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond,
n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue,
n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse,
n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output);

-- n16_MUX_uxn_opcodes_h_l1245_c7_199d
n16_MUX_uxn_opcodes_h_l1245_c7_199d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1245_c7_199d_cond,
n16_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue,
n16_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse,
n16_MUX_uxn_opcodes_h_l1245_c7_199d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc
BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_left,
BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_right,
BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d
BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_left,
BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_right,
BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0
BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_left,
BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_right,
BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_return_output);

-- MUX_uxn_opcodes_h_l1249_c32_8cbd
MUX_uxn_opcodes_h_l1249_c32_8cbd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1249_c32_8cbd_cond,
MUX_uxn_opcodes_h_l1249_c32_8cbd_iftrue,
MUX_uxn_opcodes_h_l1249_c32_8cbd_iffalse,
MUX_uxn_opcodes_h_l1249_c32_8cbd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_left,
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_right,
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10
BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_left,
BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_right,
BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_return_output);

-- MUX_uxn_opcodes_h_l1255_c24_57f8
MUX_uxn_opcodes_h_l1255_c24_57f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1255_c24_57f8_cond,
MUX_uxn_opcodes_h_l1255_c24_57f8_iftrue,
MUX_uxn_opcodes_h_l1255_c24_57f8_iffalse,
MUX_uxn_opcodes_h_l1255_c24_57f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3
CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_return_output,
 n16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
 t16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output,
 n16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output,
 t16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output,
 n16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output,
 t16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output,
 t16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output,
 n16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output,
 t16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output,
 n16_MUX_uxn_opcodes_h_l1231_c7_da57_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output,
 n16_MUX_uxn_opcodes_h_l1235_c7_a745_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output,
 n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output,
 n16_MUX_uxn_opcodes_h_l1245_c7_199d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_return_output,
 MUX_uxn_opcodes_h_l1249_c32_8cbd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_return_output,
 MUX_uxn_opcodes_h_l1255_c24_57f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_5d31 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1205_c3_efee_uxn_opcodes_h_l1205_c3_efee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_2772 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_dab4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_c857 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_12cc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_fb84 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_d711 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_4b81 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1245_c7_199d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_5df9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1217_l1236_l1227_DUPLICATE_150b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_2392_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1262_l1200_DUPLICATE_214c_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_2772 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_2772;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_5d31 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_5d31;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_dab4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_dab4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_d711 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_d711;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_12cc := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_12cc;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_5df9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_5df9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_fb84 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_fb84;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_4b81 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_4b81;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_c857 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_c857;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_right := to_unsigned(10, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_84f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_2392 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_2392_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1216_c11_5fe8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_91fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_1d5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1249_c32_584d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_left;
     BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_return_output := BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_f260] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1235_c11_3a20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_left;
     BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output := BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_7bc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1204_c6_d15a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_2be4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1204_c2_f590] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1204_c2_f590_return_output := result.is_stack_index_flipped;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1245_c7_199d] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1245_c7_199d_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1251_c11_8e1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1217_l1236_l1227_DUPLICATE_150b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1217_l1236_l1227_DUPLICATE_150b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_c3a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1255_c24_ae10] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_left;
     BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_return_output := BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_584d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_d15a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_84f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_5fe8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_f260_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_2be4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_7bc9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_3a20_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_c3a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1d5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_8e1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_91fc_return_output;
     VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_ae10_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1217_l1236_l1227_DUPLICATE_150b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1217_l1236_l1227_DUPLICATE_150b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1217_l1236_l1227_DUPLICATE_150b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_DUPLICATE_91c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_l1251_DUPLICATE_3835_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1235_l1226_l1216_l1204_l1251_DUPLICATE_846d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1257_l1245_l1235_l1226_l1216_DUPLICATE_58a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_2392_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_2392_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1241_l1231_l1222_l1212_l1245_l1235_l1226_l1216_l1204_l1251_DUPLICATE_418d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1204_c2_f590_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1245_c7_199d_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_199d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1227_c3_c07e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_left;
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_return_output := BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1246_c3_57fc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_left;
     BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_return_output := BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_0f74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_0f74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1251_c7_15c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1251_c7_15c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1249_c32_dbf0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_left;
     BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_return_output := BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_return_output;

     -- MUX[uxn_opcodes_h_l1255_c24_57f8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1255_c24_57f8_cond <= VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_cond;
     MUX_uxn_opcodes_h_l1255_c24_57f8_iftrue <= VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_iftrue;
     MUX_uxn_opcodes_h_l1255_c24_57f8_iffalse <= VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_return_output := MUX_uxn_opcodes_h_l1255_c24_57f8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1204_c1_2939] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1204_c2_f590] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_dbf0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_c07e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_57fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1218_l1237_DUPLICATE_3ee3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue := VAR_MUX_uxn_opcodes_h_l1255_c24_57f8_return_output;
     VAR_printf_uxn_opcodes_h_l1205_c3_efee_uxn_opcodes_h_l1205_c3_efee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_2939_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_0f74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1251_c7_15c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_199d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1226_c7_cabd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond;
     t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue;
     t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output := t16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;

     -- printf_uxn_opcodes_h_l1205_c3_efee[uxn_opcodes_h_l1205_c3_efee] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1205_c3_efee_uxn_opcodes_h_l1205_c3_efee_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1205_c3_efee_uxn_opcodes_h_l1205_c3_efee_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1245_c7_199d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1245_c7_199d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_cond;
     n16_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue;
     n16_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_return_output := n16_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1251_c7_15c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output;

     -- MUX[uxn_opcodes_h_l1249_c32_8cbd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1249_c32_8cbd_cond <= VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_cond;
     MUX_uxn_opcodes_h_l1249_c32_8cbd_iftrue <= VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_iftrue;
     MUX_uxn_opcodes_h_l1249_c32_8cbd_iffalse <= VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_return_output := MUX_uxn_opcodes_h_l1249_c32_8cbd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_199d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1241_c7_ef5f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1251_c7_15c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue := VAR_MUX_uxn_opcodes_h_l1249_c32_8cbd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_15c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;
     -- t16_MUX[uxn_opcodes_h_l1222_c7_f240] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1222_c7_f240_cond <= VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_cond;
     t16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue;
     t16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output := t16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_199d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1235_c7_a745] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_199d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_199d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_ef5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_ef5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_199d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1241_c7_ef5f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond;
     n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue;
     n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output := n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_199d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_ef5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1235_c7_a745] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1235_c7_a745_cond <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_cond;
     n16_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue;
     n16_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_return_output := n16_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1235_c7_a745] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1235_c7_a745] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1231_c7_da57] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_ef5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1216_c7_1663] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1216_c7_1663_cond <= VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_cond;
     t16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue;
     t16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output := t16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1241_c7_ef5f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_ef5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_ef5f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;
     -- n16_MUX[uxn_opcodes_h_l1231_c7_da57] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1231_c7_da57_cond <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_cond;
     n16_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue;
     n16_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_return_output := n16_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1235_c7_a745] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;

     -- t16_MUX[uxn_opcodes_h_l1212_c7_eb91] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond <= VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond;
     t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue;
     t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output := t16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1235_c7_a745] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_return_output := result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_da57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1235_c7_a745] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1231_c7_da57] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1235_c7_a745] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1226_c7_cabd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_a745_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1231_c7_da57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1231_c7_da57] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_return_output := result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_da57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;

     -- t16_MUX[uxn_opcodes_h_l1204_c2_f590] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1204_c2_f590_cond <= VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_cond;
     t16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue;
     t16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output := t16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1226_c7_cabd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1222_c7_f240] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;

     -- n16_MUX[uxn_opcodes_h_l1226_c7_cabd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_cond;
     n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue;
     n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output := n16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_cabd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_da57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_da57_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_cabd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1226_c7_cabd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_f240] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_f240_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1222_c7_f240] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_f240] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_cabd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1216_c7_1663] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_cabd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_cabd_return_output;
     -- n16_MUX[uxn_opcodes_h_l1216_c7_1663] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1216_c7_1663_cond <= VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_cond;
     n16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue;
     n16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output := n16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_f240] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_f240] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1222_c7_f240] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_return_output := result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1212_c7_eb91] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1216_c7_1663] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1216_c7_1663] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_f240] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_f240_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1216_c7_1663] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_eb91] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_eb91] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1216_c7_1663] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1204_c2_f590] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1216_c7_1663] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_return_output := result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1216_c7_1663] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;

     -- n16_MUX[uxn_opcodes_h_l1212_c7_eb91] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_cond;
     n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue;
     n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output := n16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_1663_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_eb91] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_eb91] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output := result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1204_c2_f590] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1204_c2_f590] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c7_eb91] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_eb91] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;

     -- n16_MUX[uxn_opcodes_h_l1204_c2_f590] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1204_c2_f590_cond <= VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_cond;
     n16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue;
     n16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output := n16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_eb91_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1204_c2_f590] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1204_c2_f590] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1204_c2_f590] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_return_output := result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1204_c2_f590] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1262_l1200_DUPLICATE_214c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1262_l1200_DUPLICATE_214c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_f590_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_f590_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1262_l1200_DUPLICATE_214c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1262_l1200_DUPLICATE_214c_return_output;
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
