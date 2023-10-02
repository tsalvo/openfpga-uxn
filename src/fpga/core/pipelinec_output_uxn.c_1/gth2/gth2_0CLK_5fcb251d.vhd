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
entity gth2_0CLK_5fcb251d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_5fcb251d;
architecture arch of gth2_0CLK_5fcb251d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1139_c6_624d]
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1139_c1_6640]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1139_c2_517b]
signal t16_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1139_c2_517b]
signal n16_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1139_c2_517b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1139_c2_517b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1139_c2_517b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1139_c2_517b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1139_c2_517b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1139_c2_517b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1139_c2_517b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1139_c2_517b]
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1140_c3_188c[uxn_opcodes_h_l1140_c3_188c]
signal printf_uxn_opcodes_h_l1140_c3_188c_uxn_opcodes_h_l1140_c3_188c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1147_c11_b3ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1147_c7_8316]
signal t16_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1147_c7_8316]
signal n16_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1147_c7_8316]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c7_8316]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c7_8316]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1147_c7_8316]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c7_8316]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c7_8316]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1147_c7_8316]
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_fd18]
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1151_c7_f0f8]
signal t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1151_c7_f0f8]
signal n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_f0f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_f0f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_f0f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1151_c7_f0f8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_f0f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_f0f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1151_c7_f0f8]
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_a44a]
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1157_c7_e186]
signal t16_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1157_c7_e186]
signal n16_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1157_c7_e186]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_e186]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_e186]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1157_c7_e186]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_e186]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_e186]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1157_c7_e186]
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_816c]
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1161_c7_25b4]
signal t16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1161_c7_25b4]
signal n16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_25b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_25b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_25b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1161_c7_25b4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_25b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_25b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_25b4]
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1162_c3_40ad]
signal BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1166_c11_169c]
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1166_c7_687d]
signal n16_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1166_c7_687d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1166_c7_687d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1166_c7_687d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1166_c7_687d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1166_c7_687d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1166_c7_687d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1166_c7_687d]
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1170_c11_86a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1170_c7_4b6e]
signal n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1170_c7_4b6e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1170_c7_4b6e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1170_c7_4b6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1170_c7_4b6e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1170_c7_4b6e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1170_c7_4b6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1170_c7_4b6e]
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_fcd8]
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1176_c7_d596]
signal n16_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1176_c7_d596]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_d596]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_d596]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1176_c7_d596]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1176_c7_d596]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1176_c7_d596]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1176_c7_d596]
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_3b44]
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1180_c7_f445]
signal n16_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c7_f445]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_f445]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_f445]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1180_c7_f445]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c7_f445]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_f445]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1180_c7_f445]
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1181_c3_2e90]
signal BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1184_c32_8e65]
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1184_c32_6a84]
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1184_c32_de2e]
signal MUX_uxn_opcodes_h_l1184_c32_de2e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_de2e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_de2e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1184_c32_de2e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1186_c11_020a]
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1186_c7_906a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1186_c7_906a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1186_c7_906a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1186_c7_906a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1186_c7_906a]
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1190_c24_bedc]
signal BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1190_c24_6f1d]
signal MUX_uxn_opcodes_h_l1190_c24_6f1d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1190_c24_6f1d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1190_c24_6f1d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1190_c24_6f1d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_e1f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_0a4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_0a4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_left,
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_right,
BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_return_output);

-- t16_MUX_uxn_opcodes_h_l1139_c2_517b
t16_MUX_uxn_opcodes_h_l1139_c2_517b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1139_c2_517b_cond,
t16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue,
t16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse,
t16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output);

-- n16_MUX_uxn_opcodes_h_l1139_c2_517b
n16_MUX_uxn_opcodes_h_l1139_c2_517b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1139_c2_517b_cond,
n16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue,
n16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse,
n16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_return_output);

-- printf_uxn_opcodes_h_l1140_c3_188c_uxn_opcodes_h_l1140_c3_188c
printf_uxn_opcodes_h_l1140_c3_188c_uxn_opcodes_h_l1140_c3_188c : entity work.printf_uxn_opcodes_h_l1140_c3_188c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1140_c3_188c_uxn_opcodes_h_l1140_c3_188c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output);

-- t16_MUX_uxn_opcodes_h_l1147_c7_8316
t16_MUX_uxn_opcodes_h_l1147_c7_8316 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1147_c7_8316_cond,
t16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue,
t16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse,
t16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output);

-- n16_MUX_uxn_opcodes_h_l1147_c7_8316
n16_MUX_uxn_opcodes_h_l1147_c7_8316 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1147_c7_8316_cond,
n16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue,
n16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse,
n16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_cond,
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_left,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_right,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output);

-- t16_MUX_uxn_opcodes_h_l1151_c7_f0f8
t16_MUX_uxn_opcodes_h_l1151_c7_f0f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond,
t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue,
t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse,
t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output);

-- n16_MUX_uxn_opcodes_h_l1151_c7_f0f8
n16_MUX_uxn_opcodes_h_l1151_c7_f0f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond,
n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue,
n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse,
n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_left,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_right,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output);

-- t16_MUX_uxn_opcodes_h_l1157_c7_e186
t16_MUX_uxn_opcodes_h_l1157_c7_e186 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1157_c7_e186_cond,
t16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue,
t16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse,
t16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output);

-- n16_MUX_uxn_opcodes_h_l1157_c7_e186
n16_MUX_uxn_opcodes_h_l1157_c7_e186 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1157_c7_e186_cond,
n16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue,
n16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse,
n16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_cond,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_left,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_right,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output);

-- t16_MUX_uxn_opcodes_h_l1161_c7_25b4
t16_MUX_uxn_opcodes_h_l1161_c7_25b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond,
t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue,
t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse,
t16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output);

-- n16_MUX_uxn_opcodes_h_l1161_c7_25b4
n16_MUX_uxn_opcodes_h_l1161_c7_25b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond,
n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue,
n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse,
n16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad
BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_left,
BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_right,
BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_left,
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_right,
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output);

-- n16_MUX_uxn_opcodes_h_l1166_c7_687d
n16_MUX_uxn_opcodes_h_l1166_c7_687d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1166_c7_687d_cond,
n16_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue,
n16_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse,
n16_MUX_uxn_opcodes_h_l1166_c7_687d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output);

-- n16_MUX_uxn_opcodes_h_l1170_c7_4b6e
n16_MUX_uxn_opcodes_h_l1170_c7_4b6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond,
n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue,
n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse,
n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_left,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_right,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output);

-- n16_MUX_uxn_opcodes_h_l1176_c7_d596
n16_MUX_uxn_opcodes_h_l1176_c7_d596 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1176_c7_d596_cond,
n16_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue,
n16_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse,
n16_MUX_uxn_opcodes_h_l1176_c7_d596_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_cond,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_left,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_right,
BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output);

-- n16_MUX_uxn_opcodes_h_l1180_c7_f445
n16_MUX_uxn_opcodes_h_l1180_c7_f445 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1180_c7_f445_cond,
n16_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue,
n16_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse,
n16_MUX_uxn_opcodes_h_l1180_c7_f445_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_cond,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90
BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_left,
BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_right,
BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65
BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_left,
BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_right,
BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_left,
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_right,
BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_return_output);

-- MUX_uxn_opcodes_h_l1184_c32_de2e
MUX_uxn_opcodes_h_l1184_c32_de2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1184_c32_de2e_cond,
MUX_uxn_opcodes_h_l1184_c32_de2e_iftrue,
MUX_uxn_opcodes_h_l1184_c32_de2e_iffalse,
MUX_uxn_opcodes_h_l1184_c32_de2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_left,
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_right,
BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc
BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_left,
BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_right,
BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_return_output);

-- MUX_uxn_opcodes_h_l1190_c24_6f1d
MUX_uxn_opcodes_h_l1190_c24_6f1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1190_c24_6f1d_cond,
MUX_uxn_opcodes_h_l1190_c24_6f1d_iftrue,
MUX_uxn_opcodes_h_l1190_c24_6f1d_iffalse,
MUX_uxn_opcodes_h_l1190_c24_6f1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_return_output,
 t16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
 n16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output,
 t16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output,
 n16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output,
 t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output,
 n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output,
 t16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output,
 n16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output,
 t16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output,
 n16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output,
 n16_MUX_uxn_opcodes_h_l1166_c7_687d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output,
 n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output,
 n16_MUX_uxn_opcodes_h_l1176_c7_d596_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output,
 n16_MUX_uxn_opcodes_h_l1180_c7_f445_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_return_output,
 MUX_uxn_opcodes_h_l1184_c32_de2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_return_output,
 MUX_uxn_opcodes_h_l1190_c24_6f1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_8161 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1140_c3_188c_uxn_opcodes_h_l1140_c3_188c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_9f1c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1155_c3_2161 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_7941 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_9f02 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_177d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_26e8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_af51 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1180_c7_f445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_2fa3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_306f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_2ef0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1135_l1197_DUPLICATE_396c_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_8161 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_8161;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_right := to_unsigned(10, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_26e8 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1174_c3_26e8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_9f02 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1164_c3_9f02;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_177d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_177d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_2fa3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1189_c3_2fa3;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_af51 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1178_c3_af51;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1155_c3_2161 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1155_c3_2161;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_9f1c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1149_c3_9f1c;
     VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_7941 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1159_c3_7941;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_iffalse := resize(to_unsigned(0, 1), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_306f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_306f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_fcd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_a44a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1184_c32_8e65] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_left;
     BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_return_output := BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1139_c2_517b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1139_c2_517b_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_e1f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1166_c11_169c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_fd18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_left;
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output := BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1190_c24_bedc] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_left;
     BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_return_output := BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_2ef0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_2ef0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1186_c11_020a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1180_c7_f445] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1180_c7_f445_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1180_c11_3b44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_left;
     BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output := BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1139_c6_624d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1147_c11_b3ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_816c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1170_c11_86a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1184_c32_8e65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c6_624d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b3ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_fd18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_a44a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_816c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_169c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1170_c11_86a4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_fcd8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1180_c11_3b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1186_c11_020a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_e1f9_return_output;
     VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1190_c24_bedc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_306f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_306f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1152_l1162_l1171_l1181_DUPLICATE_306f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1157_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_bfbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_d958_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1166_l1151_l1170_l1139_DUPLICATE_4c3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1147_l1192_l1176_l1161_l1180_l1166_l1151_l1170_DUPLICATE_bf3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_2ef0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1186_l1180_DUPLICATE_2ef0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1157_l1186_l1147_l1176_l1161_l1180_l1166_l1151_l1170_l1139_DUPLICATE_4262_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1139_c2_517b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1180_c7_f445_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_0a4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1181_c3_2e90] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_left;
     BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_return_output := BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1186_c7_906a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1180_c7_f445] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1184_c32_6a84] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_left;
     BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_return_output := BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1139_c2_517b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1139_c1_6640] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_return_output;

     -- MUX[uxn_opcodes_h_l1190_c24_6f1d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1190_c24_6f1d_cond <= VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_cond;
     MUX_uxn_opcodes_h_l1190_c24_6f1d_iftrue <= VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_iftrue;
     MUX_uxn_opcodes_h_l1190_c24_6f1d_iffalse <= VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_return_output := MUX_uxn_opcodes_h_l1190_c24_6f1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1186_c7_906a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_0a4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1162_c3_40ad] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_left;
     BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_return_output := BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1184_c32_6a84_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1162_c3_40ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1181_c3_2e90_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1153_l1172_DUPLICATE_6f7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue := VAR_MUX_uxn_opcodes_h_l1190_c24_6f1d_return_output;
     VAR_printf_uxn_opcodes_h_l1140_c3_188c_uxn_opcodes_h_l1140_c3_188c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1139_c1_6640_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1186_c7_906a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_0a4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1186_c7_906a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1176_c7_d596] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1186_c7_906a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_return_output;

     -- printf_uxn_opcodes_h_l1140_c3_188c[uxn_opcodes_h_l1140_c3_188c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1140_c3_188c_uxn_opcodes_h_l1140_c3_188c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1140_c3_188c_uxn_opcodes_h_l1140_c3_188c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1186_c7_906a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1180_c7_f445] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1180_c7_f445_cond <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_cond;
     n16_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue;
     n16_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_return_output := n16_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1180_c7_f445] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;

     -- t16_MUX[uxn_opcodes_h_l1161_c7_25b4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond;
     t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue;
     t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output := t16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1180_c7_f445] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1186_c7_906a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_return_output;

     -- MUX[uxn_opcodes_h_l1184_c32_de2e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1184_c32_de2e_cond <= VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_cond;
     MUX_uxn_opcodes_h_l1184_c32_de2e_iftrue <= VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_iftrue;
     MUX_uxn_opcodes_h_l1184_c32_de2e_iffalse <= VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_return_output := MUX_uxn_opcodes_h_l1184_c32_de2e_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue := VAR_MUX_uxn_opcodes_h_l1184_c32_de2e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1186_c7_906a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1186_c7_906a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1186_c7_906a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;
     -- n16_MUX[uxn_opcodes_h_l1176_c7_d596] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1176_c7_d596_cond <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_cond;
     n16_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue;
     n16_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_return_output := n16_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1176_c7_d596] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1180_c7_f445] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1180_c7_f445] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1180_c7_f445] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;

     -- t16_MUX[uxn_opcodes_h_l1157_c7_e186] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1157_c7_e186_cond <= VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_cond;
     t16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue;
     t16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output := t16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1170_c7_4b6e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1176_c7_d596] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1180_c7_f445] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_return_output := result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1180_c7_f445_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1170_c7_4b6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_d596] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1170_c7_4b6e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1176_c7_d596] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_d596] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1166_c7_687d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1170_c7_4b6e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond;
     n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue;
     n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output := n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1151_c7_f0f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond;
     t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue;
     t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output := t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1176_c7_d596] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_return_output := result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_d596_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1170_c7_4b6e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1166_c7_687d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1166_c7_687d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_cond;
     n16_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue;
     n16_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_return_output := n16_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1166_c7_687d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1170_c7_4b6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1170_c7_4b6e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1147_c7_8316] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1147_c7_8316_cond <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_cond;
     t16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue;
     t16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output := t16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1161_c7_25b4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1166_c7_687d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1170_c7_4b6e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1170_c7_4b6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_25b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_25b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1166_c7_687d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1166_c7_687d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1139_c2_517b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1139_c2_517b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_cond;
     t16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue;
     t16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output := t16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1166_c7_687d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1157_c7_e186] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;

     -- n16_MUX[uxn_opcodes_h_l1161_c7_25b4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_cond;
     n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue;
     n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output := n16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1166_c7_687d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1166_c7_687d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_25b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_25b4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_e186] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_25b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1151_c7_f0f8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1157_c7_e186] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1157_c7_e186_cond <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_cond;
     n16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue;
     n16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output := n16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_25b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1157_c7_e186] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_25b4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1157_c7_e186] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_return_output := result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1147_c7_8316] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_f0f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_f0f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1151_c7_f0f8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond;
     n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue;
     n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output := n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_e186] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_e186] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_e186] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_e186_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1147_c7_8316] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_f0f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1151_c7_f0f8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_f0f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c7_8316] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_f0f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1139_c2_517b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1147_c7_8316] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1147_c7_8316_cond <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_cond;
     n16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue;
     n16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output := n16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1151_c7_f0f8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c7_8316] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;

     -- n16_MUX[uxn_opcodes_h_l1139_c2_517b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1139_c2_517b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_cond;
     n16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue;
     n16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output := n16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c7_8316] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c7_8316] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1139_c2_517b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1147_c7_8316] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_return_output := result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1139_c2_517b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1147_c7_8316_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1139_c2_517b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1139_c2_517b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1139_c2_517b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1139_c2_517b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1135_l1197_DUPLICATE_396c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1135_l1197_DUPLICATE_396c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c2_517b_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c2_517b_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1135_l1197_DUPLICATE_396c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1135_l1197_DUPLICATE_396c_return_output;
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
