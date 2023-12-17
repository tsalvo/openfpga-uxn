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
-- Submodules: 58
entity equ2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_609876da;
architecture arch of equ2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_1fff]
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_d71e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1220_c2_d71e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_d71e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1220_c2_d71e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_d71e]
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1220_c2_d71e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_d71e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1220_c2_d71e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_d71e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1220_c2_d71e]
signal t16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1220_c2_d71e]
signal n16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_904a]
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_1958]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_1958]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_1958]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_1958]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_1958]
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1233_c7_1958]
signal t16_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1233_c7_1958]
signal n16_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1236_c11_ead4]
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c7_9de6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c7_9de6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c7_9de6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c7_9de6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1236_c7_9de6]
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1236_c7_9de6]
signal t16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1236_c7_9de6]
signal n16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_b98c]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_2b02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_2b02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_2b02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_2b02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_2b02]
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1241_c7_2b02]
signal t16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1241_c7_2b02]
signal n16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1242_c3_4444]
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_0d0a]
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_e3ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_e3ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_e3ea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_e3ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1245_c7_e3ea]
signal result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1245_c7_e3ea]
signal n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_795a]
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1249_c7_e450]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_e450]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1249_c7_e450]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_e450]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1249_c7_e450]
signal result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1249_c7_e450]
signal n16_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1250_c3_a79f]
signal BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1251_c30_d2f4]
signal sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1254_c21_6527]
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1254_c21_9c20]
signal MUX_uxn_opcodes_h_l1254_c21_9c20_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1254_c21_9c20_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1254_c21_9c20_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1254_c21_9c20_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e848( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_left,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_right,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e
result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e
result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e
result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

-- t16_MUX_uxn_opcodes_h_l1220_c2_d71e
t16_MUX_uxn_opcodes_h_l1220_c2_d71e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond,
t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue,
t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse,
t16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

-- n16_MUX_uxn_opcodes_h_l1220_c2_d71e
n16_MUX_uxn_opcodes_h_l1220_c2_d71e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond,
n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue,
n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse,
n16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_left,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_right,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_cond,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_return_output);

-- t16_MUX_uxn_opcodes_h_l1233_c7_1958
t16_MUX_uxn_opcodes_h_l1233_c7_1958 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1233_c7_1958_cond,
t16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue,
t16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse,
t16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output);

-- n16_MUX_uxn_opcodes_h_l1233_c7_1958
n16_MUX_uxn_opcodes_h_l1233_c7_1958 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1233_c7_1958_cond,
n16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue,
n16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse,
n16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_left,
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_right,
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output);

-- t16_MUX_uxn_opcodes_h_l1236_c7_9de6
t16_MUX_uxn_opcodes_h_l1236_c7_9de6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond,
t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue,
t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse,
t16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output);

-- n16_MUX_uxn_opcodes_h_l1236_c7_9de6
n16_MUX_uxn_opcodes_h_l1236_c7_9de6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond,
n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue,
n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse,
n16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_cond,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output);

-- t16_MUX_uxn_opcodes_h_l1241_c7_2b02
t16_MUX_uxn_opcodes_h_l1241_c7_2b02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond,
t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue,
t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse,
t16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output);

-- n16_MUX_uxn_opcodes_h_l1241_c7_2b02
n16_MUX_uxn_opcodes_h_l1241_c7_2b02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond,
n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue,
n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse,
n16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444
BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_left,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_right,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_left,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_right,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea
result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond,
result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output);

-- n16_MUX_uxn_opcodes_h_l1245_c7_e3ea
n16_MUX_uxn_opcodes_h_l1245_c7_e3ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond,
n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue,
n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse,
n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_left,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_right,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450
result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_cond,
result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_return_output);

-- n16_MUX_uxn_opcodes_h_l1249_c7_e450
n16_MUX_uxn_opcodes_h_l1249_c7_e450 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1249_c7_e450_cond,
n16_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue,
n16_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse,
n16_MUX_uxn_opcodes_h_l1249_c7_e450_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f
BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_left,
BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_right,
BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4
sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_ins,
sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_x,
sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_y,
sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527
BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_left,
BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_right,
BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_return_output);

-- MUX_uxn_opcodes_h_l1254_c21_9c20
MUX_uxn_opcodes_h_l1254_c21_9c20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1254_c21_9c20_cond,
MUX_uxn_opcodes_h_l1254_c21_9c20_iftrue,
MUX_uxn_opcodes_h_l1254_c21_9c20_iffalse,
MUX_uxn_opcodes_h_l1254_c21_9c20_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
 t16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
 n16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_return_output,
 t16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output,
 n16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output,
 t16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output,
 n16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output,
 t16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output,
 n16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output,
 n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_return_output,
 n16_MUX_uxn_opcodes_h_l1249_c7_e450_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_return_output,
 MUX_uxn_opcodes_h_l1254_c21_9c20_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1225_c3_65ec : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_b5a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_8201 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_6665 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_90c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1253_c3_e752 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_e79f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_e92c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_1e09_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_4e2b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1242_l1237_l1246_l1250_DUPLICATE_f659_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1249_l1245_DUPLICATE_ac83_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1258_l1216_DUPLICATE_0849_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1225_c3_65ec := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1225_c3_65ec;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_b5a5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_b5a5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_8201 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_8201;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1253_c3_e752 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1253_c3_e752;
     VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_6665 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_6665;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_90c4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_90c4;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_1fff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_795a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_4e2b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_4e2b_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_1e09 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_1e09_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1242_l1237_l1246_l1250_DUPLICATE_f659 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1242_l1237_l1246_l1250_DUPLICATE_f659_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_e79f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_e79f_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1251_c30_d2f4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_ins;
     sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_x;
     sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_return_output := sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_904a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_0d0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1249_l1245_DUPLICATE_ac83 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1249_l1245_DUPLICATE_ac83_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_b98c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1236_c11_ead4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_e92c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_e92c_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_1fff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_904a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_ead4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_b98c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_0d0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_795a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1242_l1237_l1246_l1250_DUPLICATE_f659_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1242_l1237_l1246_l1250_DUPLICATE_f659_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1242_l1237_l1246_l1250_DUPLICATE_f659_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_1e09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_1e09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_1e09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_1e09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_1e09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_4e2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_4e2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_4e2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_4e2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_4e2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_e92c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_e92c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_e92c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_e92c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_e92c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1249_l1245_DUPLICATE_ac83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1249_l1245_DUPLICATE_ac83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_e79f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_e79f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_e79f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_e79f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_e79f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_e79f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1220_c2_d71e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_d2f4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1242_c3_4444] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_left;
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_return_output := BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1249_c7_e450] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1249_c7_e450] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1250_c3_a79f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_left;
     BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_return_output := BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_e450] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_e450] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_4444_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_a79f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_409b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_e3ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_e3ea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1254_c21_6527] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_left;
     BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_return_output := BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_e3ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;

     -- n16_MUX[uxn_opcodes_h_l1249_c7_e450] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1249_c7_e450_cond <= VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_cond;
     n16_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue;
     n16_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_return_output := n16_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_e3ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;

     -- t16_MUX[uxn_opcodes_h_l1241_c7_2b02] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond <= VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond;
     t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue;
     t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output := t16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_6527_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_2b02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_2b02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;

     -- t16_MUX[uxn_opcodes_h_l1236_c7_9de6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond;
     t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue;
     t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output := t16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1245_c7_e3ea] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond;
     n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue;
     n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output := n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;

     -- MUX[uxn_opcodes_h_l1254_c21_9c20] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1254_c21_9c20_cond <= VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_cond;
     MUX_uxn_opcodes_h_l1254_c21_9c20_iftrue <= VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_iftrue;
     MUX_uxn_opcodes_h_l1254_c21_9c20_iffalse <= VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_return_output := MUX_uxn_opcodes_h_l1254_c21_9c20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_2b02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_2b02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue := VAR_MUX_uxn_opcodes_h_l1254_c21_9c20_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;
     -- n16_MUX[uxn_opcodes_h_l1241_c7_2b02] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_cond;
     n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue;
     n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output := n16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c7_9de6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1233_c7_1958] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1233_c7_1958_cond <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_cond;
     t16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue;
     t16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output := t16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c7_9de6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c7_9de6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1249_c7_e450] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_return_output := result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c7_9de6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e450_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_1958] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_1958] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1245_c7_e3ea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output := result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_1958] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_1958] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;

     -- t16_MUX[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond;
     t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue;
     t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output := t16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1236_c7_9de6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_cond;
     n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue;
     n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output := n16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_e3ea_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_2b02] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output := result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1233_c7_1958] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1233_c7_1958_cond <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_cond;
     n16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue;
     n16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output := n16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_2b02_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1236_c7_9de6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_cond;
     n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue;
     n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output := n16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9de6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_1958] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_return_output := result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_1958_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_d71e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1258_l1216_DUPLICATE_0849 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1258_l1216_DUPLICATE_0849_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_d71e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1258_l1216_DUPLICATE_0849_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1258_l1216_DUPLICATE_0849_return_output;
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
