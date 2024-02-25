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
-- Submodules: 71
entity and2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_50b92fe2;
architecture arch of and2_0CLK_50b92fe2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l939_c6_ac00]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l939_c2_9025]
signal t16_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l939_c2_9025]
signal tmp16_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_9025]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_9025]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_9025]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l939_c2_9025]
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_9025]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_9025]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_9025]
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_9025]
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_9025]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l939_c2_9025]
signal n16_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l952_c11_56c8]
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l952_c7_e4e6]
signal t16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l952_c7_e4e6]
signal tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_e4e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_e4e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l952_c7_e4e6]
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_e4e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_e4e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l952_c7_e4e6]
signal n16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l955_c11_328c]
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l955_c7_a102]
signal t16_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l955_c7_a102]
signal tmp16_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_a102]
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_a102]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l955_c7_a102]
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_a102]
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_a102]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l955_c7_a102]
signal n16_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l960_c11_d139]
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l960_c7_2de1]
signal t16_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l960_c7_2de1]
signal tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_2de1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_2de1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l960_c7_2de1]
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_2de1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_2de1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l960_c7_2de1]
signal n16_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l961_c3_b44b]
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l964_c11_5c6b]
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l964_c7_05f0]
signal tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_05f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_05f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l964_c7_05f0]
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_05f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_05f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l964_c7_05f0]
signal n16_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l968_c11_f31a]
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l968_c7_7d0e]
signal tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_7d0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_7d0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l968_c7_7d0e]
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_7d0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_7d0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l968_c7_7d0e]
signal n16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l969_c3_a7fa]
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l970_c11_55b1]
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l971_c30_9c50]
signal sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l976_c11_da3a]
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_a39b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_a39b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_a39b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l976_c7_a39b]
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l979_c31_d52d]
signal CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00
BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output);

-- t16_MUX_uxn_opcodes_h_l939_c2_9025
t16_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l939_c2_9025_cond,
t16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
t16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
t16_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- tmp16_MUX_uxn_opcodes_h_l939_c2_9025
tmp16_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l939_c2_9025_cond,
tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
tmp16_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025
result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_cond,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- n16_MUX_uxn_opcodes_h_l939_c2_9025
n16_MUX_uxn_opcodes_h_l939_c2_9025 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l939_c2_9025_cond,
n16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue,
n16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse,
n16_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8
BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_left,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_right,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output);

-- t16_MUX_uxn_opcodes_h_l952_c7_e4e6
t16_MUX_uxn_opcodes_h_l952_c7_e4e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond,
t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue,
t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse,
t16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6
tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond,
tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue,
tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse,
tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6
result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output);

-- n16_MUX_uxn_opcodes_h_l952_c7_e4e6
n16_MUX_uxn_opcodes_h_l952_c7_e4e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond,
n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue,
n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse,
n16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c
BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_left,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_right,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output);

-- t16_MUX_uxn_opcodes_h_l955_c7_a102
t16_MUX_uxn_opcodes_h_l955_c7_a102 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l955_c7_a102_cond,
t16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue,
t16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse,
t16_MUX_uxn_opcodes_h_l955_c7_a102_return_output);

-- tmp16_MUX_uxn_opcodes_h_l955_c7_a102
tmp16_MUX_uxn_opcodes_h_l955_c7_a102 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l955_c7_a102_cond,
tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue,
tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse,
tmp16_MUX_uxn_opcodes_h_l955_c7_a102_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102
result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_cond,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_return_output);

-- n16_MUX_uxn_opcodes_h_l955_c7_a102
n16_MUX_uxn_opcodes_h_l955_c7_a102 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l955_c7_a102_cond,
n16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue,
n16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse,
n16_MUX_uxn_opcodes_h_l955_c7_a102_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139
BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_left,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_right,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output);

-- t16_MUX_uxn_opcodes_h_l960_c7_2de1
t16_MUX_uxn_opcodes_h_l960_c7_2de1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l960_c7_2de1_cond,
t16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue,
t16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse,
t16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l960_c7_2de1
tmp16_MUX_uxn_opcodes_h_l960_c7_2de1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_cond,
tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue,
tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse,
tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1
result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_cond,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_return_output);

-- n16_MUX_uxn_opcodes_h_l960_c7_2de1
n16_MUX_uxn_opcodes_h_l960_c7_2de1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l960_c7_2de1_cond,
n16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue,
n16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse,
n16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b
BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_left,
BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_right,
BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b
BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_left,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_right,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l964_c7_05f0
tmp16_MUX_uxn_opcodes_h_l964_c7_05f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_cond,
tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue,
tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse,
tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0
result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_return_output);

-- n16_MUX_uxn_opcodes_h_l964_c7_05f0
n16_MUX_uxn_opcodes_h_l964_c7_05f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l964_c7_05f0_cond,
n16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue,
n16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse,
n16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a
BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_left,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_right,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e
tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond,
tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue,
tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse,
tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e
result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output);

-- n16_MUX_uxn_opcodes_h_l968_c7_7d0e
n16_MUX_uxn_opcodes_h_l968_c7_7d0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond,
n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue,
n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse,
n16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa
BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_left,
BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_right,
BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1
BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_left,
BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_right,
BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l971_c30_9c50
sp_relative_shift_uxn_opcodes_h_l971_c30_9c50 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_ins,
sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_x,
sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_y,
sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a
BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_left,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_right,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b
result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_cond,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l979_c31_d52d
CONST_SR_8_uxn_opcodes_h_l979_c31_d52d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_x,
CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output,
 t16_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 tmp16_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 n16_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output,
 t16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output,
 tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output,
 n16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output,
 t16_MUX_uxn_opcodes_h_l955_c7_a102_return_output,
 tmp16_MUX_uxn_opcodes_h_l955_c7_a102_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_return_output,
 n16_MUX_uxn_opcodes_h_l955_c7_a102_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output,
 t16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output,
 tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_return_output,
 n16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output,
 tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_return_output,
 n16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output,
 tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output,
 n16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_return_output,
 BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_return_output,
 sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_return_output,
 CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_8351 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_b9ea : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_aa08 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_4aa8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_2bb4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_52c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_b51b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_728f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_f159 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_d679_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l964_l960_l955_l952_l939_l976_DUPLICATE_347b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_DUPLICATE_e96a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l964_l960_l955_l952_l976_DUPLICATE_e75a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_l976_DUPLICATE_8201_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l969_l956_l961_DUPLICATE_1814_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_f766_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l983_l935_DUPLICATE_6db4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_728f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_728f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_52c0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_52c0;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_8351 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_8351;
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_aa08 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_aa08;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_f159 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_f159;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_b9ea := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_b9ea;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_4aa8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_4aa8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_2bb4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_2bb4;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse := tmp16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_9025_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l964_l960_l955_l952_l939_l976_DUPLICATE_347b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l964_l960_l955_l952_l939_l976_DUPLICATE_347b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l968_c11_f31a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_left;
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output := BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_DUPLICATE_e96a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_DUPLICATE_e96a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l976_c11_da3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_9025_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_9025_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_f766 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_f766_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_9025_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l952_c11_56c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c6_ac00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l969_l956_l961_DUPLICATE_1814 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l969_l956_l961_DUPLICATE_1814_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l964_c11_5c6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l971_c30_9c50] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_ins;
     sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_x <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_x;
     sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_y <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_return_output := sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l979_c31_d52d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_return_output := CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l964_l960_l955_l952_l976_DUPLICATE_e75a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l964_l960_l955_l952_l976_DUPLICATE_e75a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_l976_DUPLICATE_8201 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_l976_DUPLICATE_8201_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l960_c11_d139] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_left;
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output := BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l955_c11_328c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_left;
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output := BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ac00_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_56c8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_328c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_d139_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_5c6b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_f31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_da3a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l969_l956_l961_DUPLICATE_1814_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l969_l956_l961_DUPLICATE_1814_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l969_l956_l961_DUPLICATE_1814_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l964_l960_l955_l952_l976_DUPLICATE_e75a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l964_l960_l955_l952_l976_DUPLICATE_e75a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l964_l960_l955_l952_l976_DUPLICATE_e75a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l964_l960_l955_l952_l976_DUPLICATE_e75a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l964_l960_l955_l952_l976_DUPLICATE_e75a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_l976_DUPLICATE_8201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_l976_DUPLICATE_8201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_l976_DUPLICATE_8201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_l976_DUPLICATE_8201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_l976_DUPLICATE_8201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_l976_DUPLICATE_8201_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_DUPLICATE_e96a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_DUPLICATE_e96a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_DUPLICATE_e96a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_DUPLICATE_e96a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l968_l964_l960_l955_l952_DUPLICATE_e96a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_f766_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_f766_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l964_l960_l955_l952_l939_l976_DUPLICATE_347b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l964_l960_l955_l952_l939_l976_DUPLICATE_347b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l964_l960_l955_l952_l939_l976_DUPLICATE_347b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l964_l960_l955_l952_l939_l976_DUPLICATE_347b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l964_l960_l955_l952_l939_l976_DUPLICATE_347b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l964_l960_l955_l952_l939_l976_DUPLICATE_347b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_9025_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_9025_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_9025_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_9025_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_9c50_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_a39b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l969_c3_a7fa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_left;
     BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_return_output := BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_7d0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_a39b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l961_c3_b44b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_left;
     BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_return_output := BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l979_c21_d679] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_d679_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_d52d_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_a39b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b44b_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_right := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_a7fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_d679_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_29f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_a39b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_a39b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_a39b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_7d0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_7d0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_7d0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_05f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l968_c7_7d0e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond;
     n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue;
     n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output := n16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l970_c11_55b1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_left;
     BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_return_output := BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l976_c7_a39b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_return_output := result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_return_output;

     -- t16_MUX[uxn_opcodes_h_l960_c7_2de1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l960_c7_2de1_cond <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_cond;
     t16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue;
     t16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output := t16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_a39b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse := VAR_t16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;
     -- n16_MUX[uxn_opcodes_h_l964_c7_05f0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l964_c7_05f0_cond <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_cond;
     n16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue;
     n16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output := n16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_05f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;

     -- t16_MUX[uxn_opcodes_h_l955_c7_a102] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l955_c7_a102_cond <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_cond;
     t16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue;
     t16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_return_output := t16_MUX_uxn_opcodes_h_l955_c7_a102_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l974_c21_b51b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_b51b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_55b1_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_05f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_05f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l968_c7_7d0e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_cond;
     tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output := tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_2de1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_b51b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l955_c7_a102_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_a102] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_2de1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l968_c7_7d0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l964_c7_05f0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_cond;
     tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output := tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l960_c7_2de1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l960_c7_2de1_cond <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_cond;
     n16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue;
     n16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output := n16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_2de1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;

     -- t16_MUX[uxn_opcodes_h_l952_c7_e4e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond;
     t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue;
     t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output := t16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_2de1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse := VAR_n16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_a102_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_7d0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_t16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l960_c7_2de1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_cond;
     tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output := tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l964_c7_05f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;

     -- t16_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     t16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     t16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_return_output := t16_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_a102] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_return_output;

     -- n16_MUX[uxn_opcodes_h_l955_c7_a102] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l955_c7_a102_cond <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_cond;
     n16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue;
     n16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_return_output := n16_MUX_uxn_opcodes_h_l955_c7_a102_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_a102] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_a102] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_e4e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l955_c7_a102_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_a102_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_a102_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_a102_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_05f0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l939_c2_9025_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_e4e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;

     -- n16_MUX[uxn_opcodes_h_l952_c7_e4e6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond;
     n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue;
     n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output := n16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_e4e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l960_c7_2de1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_return_output := result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l955_c7_a102] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l955_c7_a102_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_cond;
     tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iftrue;
     tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_return_output := tmp16_MUX_uxn_opcodes_h_l955_c7_a102_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_e4e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_n16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_2de1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_a102_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l952_c7_e4e6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_cond;
     tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output := tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;

     -- n16_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     n16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     n16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_return_output := n16_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l955_c7_a102] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_cond;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_return_output := result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l939_c2_9025_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_a102_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l952_c7_e4e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_return_output := tmp16_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_e4e6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_9025_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l939_c2_9025] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_cond;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_return_output := result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l983_l935_DUPLICATE_6db4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l983_l935_DUPLICATE_6db4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_9025_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_9025_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l983_l935_DUPLICATE_6db4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l983_l935_DUPLICATE_6db4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
