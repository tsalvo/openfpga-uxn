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
-- BIN_OP_EQ[uxn_opcodes_h_l939_c6_ca82]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal t16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal n16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l939_c2_5ceb]
signal tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l952_c11_8814]
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l952_c7_3799]
signal t16_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l952_c7_3799]
signal n16_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_3799]
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l952_c7_3799]
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_3799]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_3799]
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_3799]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l952_c7_3799]
signal tmp16_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l955_c11_318b]
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l955_c7_e5da]
signal t16_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l955_c7_e5da]
signal n16_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_e5da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l955_c7_e5da]
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_e5da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_e5da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_e5da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l955_c7_e5da]
signal tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l960_c11_66fc]
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l960_c7_e6e3]
signal t16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l960_c7_e6e3]
signal n16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_e6e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l960_c7_e6e3]
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_e6e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_e6e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_e6e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l960_c7_e6e3]
signal tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l961_c3_58b9]
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l964_c11_d83d]
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l964_c7_c349]
signal n16_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_c349]
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l964_c7_c349]
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_c349]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_c349]
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_c349]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l964_c7_c349]
signal tmp16_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l968_c11_2353]
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l968_c7_f2c2]
signal n16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_f2c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l968_c7_f2c2]
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_f2c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_f2c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_f2c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l968_c7_f2c2]
signal tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l969_c3_055c]
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l970_c11_110c]
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l971_c30_ff31]
signal sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l976_c11_cdee]
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l976_c7_ed16]
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_ed16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_ed16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_ed16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l979_c31_97c2]
signal CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82
BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output);

-- t16_MUX_uxn_opcodes_h_l939_c2_5ceb
t16_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
t16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- n16_MUX_uxn_opcodes_h_l939_c2_5ceb
n16_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
n16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb
result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb
tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond,
tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue,
tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse,
tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814
BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_left,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_right,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output);

-- t16_MUX_uxn_opcodes_h_l952_c7_3799
t16_MUX_uxn_opcodes_h_l952_c7_3799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l952_c7_3799_cond,
t16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue,
t16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse,
t16_MUX_uxn_opcodes_h_l952_c7_3799_return_output);

-- n16_MUX_uxn_opcodes_h_l952_c7_3799
n16_MUX_uxn_opcodes_h_l952_c7_3799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l952_c7_3799_cond,
n16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue,
n16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse,
n16_MUX_uxn_opcodes_h_l952_c7_3799_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799
result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_cond,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_return_output);

-- tmp16_MUX_uxn_opcodes_h_l952_c7_3799
tmp16_MUX_uxn_opcodes_h_l952_c7_3799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l952_c7_3799_cond,
tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue,
tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse,
tmp16_MUX_uxn_opcodes_h_l952_c7_3799_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b
BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_left,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_right,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output);

-- t16_MUX_uxn_opcodes_h_l955_c7_e5da
t16_MUX_uxn_opcodes_h_l955_c7_e5da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l955_c7_e5da_cond,
t16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue,
t16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse,
t16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output);

-- n16_MUX_uxn_opcodes_h_l955_c7_e5da
n16_MUX_uxn_opcodes_h_l955_c7_e5da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l955_c7_e5da_cond,
n16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue,
n16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse,
n16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da
result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_cond,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_return_output);

-- tmp16_MUX_uxn_opcodes_h_l955_c7_e5da
tmp16_MUX_uxn_opcodes_h_l955_c7_e5da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_cond,
tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue,
tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse,
tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc
BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_left,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_right,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output);

-- t16_MUX_uxn_opcodes_h_l960_c7_e6e3
t16_MUX_uxn_opcodes_h_l960_c7_e6e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond,
t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue,
t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse,
t16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output);

-- n16_MUX_uxn_opcodes_h_l960_c7_e6e3
n16_MUX_uxn_opcodes_h_l960_c7_e6e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond,
n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue,
n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse,
n16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3
result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3
tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond,
tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue,
tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse,
tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9
BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_left,
BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_right,
BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d
BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_left,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_right,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output);

-- n16_MUX_uxn_opcodes_h_l964_c7_c349
n16_MUX_uxn_opcodes_h_l964_c7_c349 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l964_c7_c349_cond,
n16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue,
n16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse,
n16_MUX_uxn_opcodes_h_l964_c7_c349_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349
result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_cond,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_return_output);

-- tmp16_MUX_uxn_opcodes_h_l964_c7_c349
tmp16_MUX_uxn_opcodes_h_l964_c7_c349 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l964_c7_c349_cond,
tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue,
tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse,
tmp16_MUX_uxn_opcodes_h_l964_c7_c349_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353
BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_left,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_right,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output);

-- n16_MUX_uxn_opcodes_h_l968_c7_f2c2
n16_MUX_uxn_opcodes_h_l968_c7_f2c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond,
n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue,
n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse,
n16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2
result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2
tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond,
tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue,
tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse,
tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l969_c3_055c
BIN_OP_OR_uxn_opcodes_h_l969_c3_055c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_left,
BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_right,
BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l970_c11_110c
BIN_OP_AND_uxn_opcodes_h_l970_c11_110c : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_left,
BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_right,
BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l971_c30_ff31
sp_relative_shift_uxn_opcodes_h_l971_c30_ff31 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_ins,
sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_x,
sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_y,
sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee
BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_left,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_right,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16
result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_cond,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_return_output);

-- CONST_SR_8_uxn_opcodes_h_l979_c31_97c2
CONST_SR_8_uxn_opcodes_h_l979_c31_97c2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_x,
CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output,
 t16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 n16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output,
 t16_MUX_uxn_opcodes_h_l952_c7_3799_return_output,
 n16_MUX_uxn_opcodes_h_l952_c7_3799_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_return_output,
 tmp16_MUX_uxn_opcodes_h_l952_c7_3799_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output,
 t16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output,
 n16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_return_output,
 tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output,
 t16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output,
 n16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output,
 tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output,
 n16_MUX_uxn_opcodes_h_l964_c7_c349_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_return_output,
 tmp16_MUX_uxn_opcodes_h_l964_c7_c349_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output,
 n16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output,
 tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_return_output,
 sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_return_output,
 CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_527c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_b9af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_1072 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_62b9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_3bd6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_b108 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_d78d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_17ef : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_694d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_b471_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l955_l952_l939_l976_l964_l960_DUPLICATE_c624_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l952_l968_l964_l960_DUPLICATE_c80b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l955_l952_l976_l964_l960_DUPLICATE_bec6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l955_l952_l976_l968_l964_l960_DUPLICATE_20ca_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_ea19_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_54f8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l935_l983_DUPLICATE_51d1_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_62b9 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_62b9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_b108 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_b108;
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_b9af := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_b9af;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_17ef := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_17ef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_694d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_694d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_527c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_527c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_1072 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_1072;
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_3bd6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_3bd6;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse := tmp16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_54f8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_54f8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c6_ca82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l952_c11_8814] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_left;
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output := BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l960_c11_66fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l955_l952_l939_l976_l964_l960_DUPLICATE_c624 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l955_l952_l939_l976_l964_l960_DUPLICATE_c624_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l968_c11_2353] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_left;
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output := BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l964_c11_d83d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_left;
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output := BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_ea19 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_ea19_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l976_c11_cdee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_left;
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_return_output := BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l955_c11_318b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_left;
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output := BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l952_l968_l964_l960_DUPLICATE_c80b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l952_l968_l964_l960_DUPLICATE_c80b_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l955_l952_l976_l964_l960_DUPLICATE_bec6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l955_l952_l976_l964_l960_DUPLICATE_bec6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l955_l952_l976_l968_l964_l960_DUPLICATE_20ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l955_l952_l976_l968_l964_l960_DUPLICATE_20ca_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l971_c30_ff31] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_ins;
     sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_x <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_x;
     sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_y <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_return_output := sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l979_c31_97c2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_return_output := CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_ca82_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_8814_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_318b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_66fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_d83d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_2353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_cdee_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_ea19_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_ea19_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_ea19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l955_l952_l976_l964_l960_DUPLICATE_bec6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l955_l952_l976_l964_l960_DUPLICATE_bec6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l955_l952_l976_l964_l960_DUPLICATE_bec6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l955_l952_l976_l964_l960_DUPLICATE_bec6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l955_l952_l976_l964_l960_DUPLICATE_bec6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l955_l952_l976_l968_l964_l960_DUPLICATE_20ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l955_l952_l976_l968_l964_l960_DUPLICATE_20ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l955_l952_l976_l968_l964_l960_DUPLICATE_20ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l955_l952_l976_l968_l964_l960_DUPLICATE_20ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l955_l952_l976_l968_l964_l960_DUPLICATE_20ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l955_l952_l976_l968_l964_l960_DUPLICATE_20ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l952_l968_l964_l960_DUPLICATE_c80b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l952_l968_l964_l960_DUPLICATE_c80b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l952_l968_l964_l960_DUPLICATE_c80b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l952_l968_l964_l960_DUPLICATE_c80b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l952_l968_l964_l960_DUPLICATE_c80b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_54f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_54f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l955_l952_l939_l976_l964_l960_DUPLICATE_c624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l955_l952_l939_l976_l964_l960_DUPLICATE_c624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l955_l952_l939_l976_l964_l960_DUPLICATE_c624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l955_l952_l939_l976_l964_l960_DUPLICATE_c624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l955_l952_l939_l976_l964_l960_DUPLICATE_c624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l955_l952_l939_l976_l964_l960_DUPLICATE_c624_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_5ceb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_ff31_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l961_c3_58b9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_left;
     BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_return_output := BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l969_c3_055c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_left;
     BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_return_output := BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_ed16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l979_c21_b471] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_b471_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_97c2_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_ed16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_f2c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_ed16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_58b9_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_right := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_055c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_b471_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_6497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_ed16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_ed16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_ed16_return_output;
     -- t16_MUX[uxn_opcodes_h_l960_c7_e6e3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond;
     t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue;
     t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output := t16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_f2c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;

     -- n16_MUX[uxn_opcodes_h_l968_c7_f2c2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond;
     n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue;
     n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output := n16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_c349] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l970_c11_110c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_left;
     BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_return_output := BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_f2c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_f2c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l976_c7_ed16] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_cond;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_return_output := result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse := VAR_n16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_c349_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_ed16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse := VAR_t16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;
     -- t16_MUX[uxn_opcodes_h_l955_c7_e5da] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l955_c7_e5da_cond <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_cond;
     t16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue;
     t16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output := t16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_e6e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l964_c7_c349] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l964_c7_c349_cond <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_cond;
     n16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue;
     n16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_return_output := n16_MUX_uxn_opcodes_h_l964_c7_c349_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_c349] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_c349] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l974_c21_d78d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_d78d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_110c_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l968_c7_f2c2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_cond;
     tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output := tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_c349] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_d78d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l964_c7_c349_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_c349_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_c349_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_c349_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse := VAR_t16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l964_c7_c349] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l964_c7_c349_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_cond;
     tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iftrue;
     tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_return_output := tmp16_MUX_uxn_opcodes_h_l964_c7_c349_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_e5da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;

     -- t16_MUX[uxn_opcodes_h_l952_c7_3799] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l952_c7_3799_cond <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_cond;
     t16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue;
     t16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_return_output := t16_MUX_uxn_opcodes_h_l952_c7_3799_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_e6e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l968_c7_f2c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_e6e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l960_c7_e6e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond;
     n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue;
     n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output := n16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_e6e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse := VAR_n16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f2c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l952_c7_3799_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_c349_return_output;
     -- t16_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := t16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_3799] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l964_c7_c349] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_cond;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_return_output := result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_e5da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l960_c7_e6e3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_cond;
     tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output := tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l955_c7_e5da] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l955_c7_e5da_cond <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_cond;
     n16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue;
     n16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output := n16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_e5da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_e5da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse := VAR_n16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_3799_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_c349_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;
     -- n16_MUX[uxn_opcodes_h_l952_c7_3799] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l952_c7_3799_cond <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_cond;
     n16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue;
     n16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_return_output := n16_MUX_uxn_opcodes_h_l952_c7_3799_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l960_c7_e6e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_3799] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l955_c7_e5da] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_cond;
     tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue;
     tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output := tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_3799] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_3799] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l952_c7_3799_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_3799_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_3799_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_3799_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e6e3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l955_c7_e5da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_return_output := result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;

     -- n16_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := n16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l952_c7_3799] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l952_c7_3799_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_cond;
     tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iftrue;
     tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_return_output := tmp16_MUX_uxn_opcodes_h_l952_c7_3799_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e5da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_3799_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l952_c7_3799] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_cond;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_return_output := result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_3799_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l939_c2_5ceb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output := result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l935_l983_DUPLICATE_51d1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l935_l983_DUPLICATE_51d1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_5ceb_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l935_l983_DUPLICATE_51d1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l935_l983_DUPLICATE_51d1_return_output;
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
