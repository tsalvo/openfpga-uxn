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
-- BIN_OP_EQ[uxn_opcodes_h_l939_c6_1105]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_7937]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_7937]
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l939_c2_7937]
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_7937]
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_7937]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_7937]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_7937]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_7937]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_7937]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l939_c2_7937]
signal tmp16_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l939_c2_7937]
signal t16_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l939_c2_7937]
signal n16_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l952_c11_2aa9]
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_9e0d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_9e0d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l952_c7_9e0d]
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_9e0d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_9e0d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l952_c7_9e0d]
signal tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l952_c7_9e0d]
signal t16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l952_c7_9e0d]
signal n16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l955_c11_2394]
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_0459]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_0459]
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l955_c7_0459]
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_0459]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_0459]
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l955_c7_0459]
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l955_c7_0459]
signal t16_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l955_c7_0459]
signal n16_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l960_c11_f18c]
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_e340]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_e340]
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l960_c7_e340]
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_e340]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_e340]
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l960_c7_e340]
signal tmp16_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l960_c7_e340]
signal t16_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l960_c7_e340]
signal n16_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l961_c3_c933]
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l964_c11_9540]
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_490c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_490c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l964_c7_490c]
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_490c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_490c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l964_c7_490c]
signal tmp16_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l964_c7_490c]
signal n16_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l968_c11_08c4]
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_27db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_27db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l968_c7_27db]
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_27db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_27db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l968_c7_27db]
signal tmp16_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l968_c7_27db]
signal n16_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l969_c3_ccf5]
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l970_c11_81c7]
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l971_c30_414c]
signal sp_relative_shift_uxn_opcodes_h_l971_c30_414c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_414c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_414c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_414c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l976_c11_ba2f]
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_f221]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_f221]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_f221]
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l976_c7_f221]
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l979_c31_4234]
signal CONST_SR_8_uxn_opcodes_h_l979_c31_4234_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l979_c31_4234_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105
BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937
result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_cond,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- tmp16_MUX_uxn_opcodes_h_l939_c2_7937
tmp16_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l939_c2_7937_cond,
tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
tmp16_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- t16_MUX_uxn_opcodes_h_l939_c2_7937
t16_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l939_c2_7937_cond,
t16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
t16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
t16_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- n16_MUX_uxn_opcodes_h_l939_c2_7937
n16_MUX_uxn_opcodes_h_l939_c2_7937 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l939_c2_7937_cond,
n16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue,
n16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse,
n16_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9
BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_left,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_right,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d
result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_cond,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d
tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond,
tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue,
tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse,
tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output);

-- t16_MUX_uxn_opcodes_h_l952_c7_9e0d
t16_MUX_uxn_opcodes_h_l952_c7_9e0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond,
t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue,
t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse,
t16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output);

-- n16_MUX_uxn_opcodes_h_l952_c7_9e0d
n16_MUX_uxn_opcodes_h_l952_c7_9e0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond,
n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue,
n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse,
n16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394
BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_left,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_right,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_cond,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_return_output);

-- tmp16_MUX_uxn_opcodes_h_l955_c7_0459
tmp16_MUX_uxn_opcodes_h_l955_c7_0459 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l955_c7_0459_cond,
tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue,
tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse,
tmp16_MUX_uxn_opcodes_h_l955_c7_0459_return_output);

-- t16_MUX_uxn_opcodes_h_l955_c7_0459
t16_MUX_uxn_opcodes_h_l955_c7_0459 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l955_c7_0459_cond,
t16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue,
t16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse,
t16_MUX_uxn_opcodes_h_l955_c7_0459_return_output);

-- n16_MUX_uxn_opcodes_h_l955_c7_0459
n16_MUX_uxn_opcodes_h_l955_c7_0459 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l955_c7_0459_cond,
n16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue,
n16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse,
n16_MUX_uxn_opcodes_h_l955_c7_0459_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c
BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_left,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_right,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340
result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_cond,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_return_output);

-- tmp16_MUX_uxn_opcodes_h_l960_c7_e340
tmp16_MUX_uxn_opcodes_h_l960_c7_e340 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l960_c7_e340_cond,
tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue,
tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse,
tmp16_MUX_uxn_opcodes_h_l960_c7_e340_return_output);

-- t16_MUX_uxn_opcodes_h_l960_c7_e340
t16_MUX_uxn_opcodes_h_l960_c7_e340 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l960_c7_e340_cond,
t16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue,
t16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse,
t16_MUX_uxn_opcodes_h_l960_c7_e340_return_output);

-- n16_MUX_uxn_opcodes_h_l960_c7_e340
n16_MUX_uxn_opcodes_h_l960_c7_e340 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l960_c7_e340_cond,
n16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue,
n16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse,
n16_MUX_uxn_opcodes_h_l960_c7_e340_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l961_c3_c933
BIN_OP_OR_uxn_opcodes_h_l961_c3_c933 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_left,
BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_right,
BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540
BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_left,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_right,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c
result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_cond,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l964_c7_490c
tmp16_MUX_uxn_opcodes_h_l964_c7_490c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l964_c7_490c_cond,
tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue,
tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse,
tmp16_MUX_uxn_opcodes_h_l964_c7_490c_return_output);

-- n16_MUX_uxn_opcodes_h_l964_c7_490c
n16_MUX_uxn_opcodes_h_l964_c7_490c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l964_c7_490c_cond,
n16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue,
n16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse,
n16_MUX_uxn_opcodes_h_l964_c7_490c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4
BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_left,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_right,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db
result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_cond,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l968_c7_27db
tmp16_MUX_uxn_opcodes_h_l968_c7_27db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l968_c7_27db_cond,
tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue,
tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse,
tmp16_MUX_uxn_opcodes_h_l968_c7_27db_return_output);

-- n16_MUX_uxn_opcodes_h_l968_c7_27db
n16_MUX_uxn_opcodes_h_l968_c7_27db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l968_c7_27db_cond,
n16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue,
n16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse,
n16_MUX_uxn_opcodes_h_l968_c7_27db_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5
BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_left,
BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_right,
BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7
BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_left,
BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_right,
BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l971_c30_414c
sp_relative_shift_uxn_opcodes_h_l971_c30_414c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l971_c30_414c_ins,
sp_relative_shift_uxn_opcodes_h_l971_c30_414c_x,
sp_relative_shift_uxn_opcodes_h_l971_c30_414c_y,
sp_relative_shift_uxn_opcodes_h_l971_c30_414c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f
BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_left,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_right,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221
result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_cond,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_return_output);

-- CONST_SR_8_uxn_opcodes_h_l979_c31_4234
CONST_SR_8_uxn_opcodes_h_l979_c31_4234 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l979_c31_4234_x,
CONST_SR_8_uxn_opcodes_h_l979_c31_4234_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7
CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 tmp16_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 t16_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 n16_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output,
 tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output,
 t16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output,
 n16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_return_output,
 tmp16_MUX_uxn_opcodes_h_l955_c7_0459_return_output,
 t16_MUX_uxn_opcodes_h_l955_c7_0459_return_output,
 n16_MUX_uxn_opcodes_h_l955_c7_0459_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_return_output,
 tmp16_MUX_uxn_opcodes_h_l960_c7_e340_return_output,
 t16_MUX_uxn_opcodes_h_l960_c7_e340_return_output,
 n16_MUX_uxn_opcodes_h_l960_c7_e340_return_output,
 BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_return_output,
 tmp16_MUX_uxn_opcodes_h_l964_c7_490c_return_output,
 n16_MUX_uxn_opcodes_h_l964_c7_490c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_return_output,
 tmp16_MUX_uxn_opcodes_h_l968_c7_27db_return_output,
 n16_MUX_uxn_opcodes_h_l968_c7_27db_return_output,
 BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_return_output,
 sp_relative_shift_uxn_opcodes_h_l971_c30_414c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_return_output,
 CONST_SR_8_uxn_opcodes_h_l979_c31_4234_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_819e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_672f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_d1d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_7630 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_6e45 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_4881 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_6751_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_e2cd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_5d63 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_4234_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_4234_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_daa1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_003a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_6c81_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_146b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_e773_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l965_l956_DUPLICATE_8990_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l964_l976_DUPLICATE_5106_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l983_l935_DUPLICATE_3a65_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_5d63 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_5d63;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_6e45 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_6e45;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_672f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_672f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_4881 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_4881;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_d1d4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_d1d4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_7630 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_7630;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_e2cd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_e2cd;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_819e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_819e;
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_4234_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_e773 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_e773_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l964_c11_9540] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_left;
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output := BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l968_c11_08c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_7937_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l960_c11_f18c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_left;
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output := BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_146b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_146b_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_7937_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l965_l956_DUPLICATE_8990 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l965_l956_DUPLICATE_8990_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_7937_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_6c81 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_6c81_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l952_c11_2aa9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_left;
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output := BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_7937_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l955_c11_2394] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_left;
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output := BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l964_l976_DUPLICATE_5106 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l964_l976_DUPLICATE_5106_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_003a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_003a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c6_1105] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l979_c31_4234] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l979_c31_4234_x <= VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_4234_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_4234_return_output := CONST_SR_8_uxn_opcodes_h_l979_c31_4234_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l971_c30_414c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l971_c30_414c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_ins;
     sp_relative_shift_uxn_opcodes_h_l971_c30_414c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_x;
     sp_relative_shift_uxn_opcodes_h_l971_c30_414c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_return_output := sp_relative_shift_uxn_opcodes_h_l971_c30_414c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l976_c11_ba2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_1105_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_2aa9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_2394_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_f18c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_9540_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_08c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_ba2f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l965_l956_DUPLICATE_8990_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l965_l956_DUPLICATE_8990_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l965_l956_DUPLICATE_8990_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_6c81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_6c81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_6c81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_6c81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_6c81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_e773_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_e773_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_e773_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_e773_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_e773_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_e773_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_146b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_146b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_146b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_146b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_146b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l964_l976_DUPLICATE_5106_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l964_l976_DUPLICATE_5106_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_003a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_003a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_003a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_003a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_003a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_003a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_7937_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_7937_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_7937_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_7937_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_414c_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_f221] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_f221] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_f221] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_27db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l969_c3_ccf5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_left;
     BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_return_output := BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l961_c3_c933] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_left;
     BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_return_output := BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l979_c21_daa1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_daa1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_4234_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_c933_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_right := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_ccf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_daa1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_a3e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_f221_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_27db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_f221_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_f221_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_27db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_27db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_490c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_return_output;

     -- t16_MUX[uxn_opcodes_h_l960_c7_e340] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l960_c7_e340_cond <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_cond;
     t16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue;
     t16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_return_output := t16_MUX_uxn_opcodes_h_l960_c7_e340_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l976_c7_f221] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_cond;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_return_output := result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l970_c11_81c7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_left;
     BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_return_output := BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l968_c7_27db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l968_c7_27db_cond <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_cond;
     n16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue;
     n16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_return_output := n16_MUX_uxn_opcodes_h_l968_c7_27db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_27db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l968_c7_27db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_27db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_490c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_27db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_27db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_f221_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse := VAR_t16_MUX_uxn_opcodes_h_l960_c7_e340_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_490c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_490c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l968_c7_27db] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l968_c7_27db_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_cond;
     tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iftrue;
     tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_return_output := tmp16_MUX_uxn_opcodes_h_l968_c7_27db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_e340] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_return_output;

     -- t16_MUX[uxn_opcodes_h_l955_c7_0459] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l955_c7_0459_cond <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_cond;
     t16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue;
     t16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_return_output := t16_MUX_uxn_opcodes_h_l955_c7_0459_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_490c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_return_output;

     -- n16_MUX[uxn_opcodes_h_l964_c7_490c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l964_c7_490c_cond <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_cond;
     n16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue;
     n16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_return_output := n16_MUX_uxn_opcodes_h_l964_c7_490c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l974_c21_6751] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_6751_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_81c7_return_output);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_6751_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse := VAR_n16_MUX_uxn_opcodes_h_l964_c7_490c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_490c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_e340_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_490c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_490c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l955_c7_0459_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_27db_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l964_c7_490c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l964_c7_490c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_cond;
     tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_return_output := tmp16_MUX_uxn_opcodes_h_l964_c7_490c_return_output;

     -- t16_MUX[uxn_opcodes_h_l952_c7_9e0d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond;
     t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue;
     t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output := t16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l968_c7_27db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_return_output := result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_e340] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_0459] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_return_output;

     -- n16_MUX[uxn_opcodes_h_l960_c7_e340] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l960_c7_e340_cond <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_cond;
     n16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue;
     n16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_return_output := n16_MUX_uxn_opcodes_h_l960_c7_e340_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_e340] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_e340] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse := VAR_n16_MUX_uxn_opcodes_h_l960_c7_e340_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_e340_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0459_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_e340_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_e340_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_27db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_t16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_490c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_0459] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_9e0d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_0459] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l960_c7_e340] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l960_c7_e340_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_cond;
     tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iftrue;
     tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_return_output := tmp16_MUX_uxn_opcodes_h_l960_c7_e340_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l964_c7_490c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_return_output := result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_return_output;

     -- t16_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     t16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     t16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_return_output := t16_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- n16_MUX[uxn_opcodes_h_l955_c7_0459] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l955_c7_0459_cond <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_cond;
     n16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue;
     n16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_return_output := n16_MUX_uxn_opcodes_h_l955_c7_0459_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_0459] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l955_c7_0459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0459_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0459_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0459_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_490c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l939_c2_7937_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_e340_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_9e0d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_9e0d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l960_c7_e340] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_cond;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_return_output := result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_return_output;

     -- n16_MUX[uxn_opcodes_h_l952_c7_9e0d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond;
     n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue;
     n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output := n16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_9e0d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l955_c7_0459] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l955_c7_0459_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_cond;
     tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iftrue;
     tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_return_output := tmp16_MUX_uxn_opcodes_h_l955_c7_0459_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_n16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_e340_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0459_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l952_c7_9e0d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_cond;
     tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output := tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l955_c7_0459] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_cond;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_return_output := result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- n16_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     n16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     n16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_return_output := n16_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l939_c2_7937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0459_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_return_output := tmp16_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l952_c7_9e0d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output := result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_9e0d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7937_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l939_c2_7937] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_cond;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_return_output := result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l983_l935_DUPLICATE_3a65 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l983_l935_DUPLICATE_3a65_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7937_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7937_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l983_l935_DUPLICATE_3a65_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l983_l935_DUPLICATE_3a65_return_output;
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
