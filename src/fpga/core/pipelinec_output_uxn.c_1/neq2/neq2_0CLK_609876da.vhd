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
entity neq2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_609876da;
architecture arch of neq2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1278_c6_ed92]
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1278_c2_16e0]
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c2_16e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1278_c2_16e0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1278_c2_16e0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c2_16e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1278_c2_16e0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1278_c2_16e0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c2_16e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c2_16e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1278_c2_16e0]
signal n16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1278_c2_16e0]
signal t16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_ac27]
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1291_c7_f5e0]
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_f5e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_f5e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_f5e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_f5e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1291_c7_f5e0]
signal n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1291_c7_f5e0]
signal t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1294_c11_2de1]
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1294_c7_8309]
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c7_8309]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c7_8309]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c7_8309]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c7_8309]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1294_c7_8309]
signal n16_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1294_c7_8309]
signal t16_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_1c6c]
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1299_c7_5464]
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_5464]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_5464]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_5464]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_5464]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1299_c7_5464]
signal n16_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1299_c7_5464]
signal t16_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1300_c3_cda1]
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_5fc3]
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_1de7]
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_1de7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_1de7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_1de7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_1de7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1303_c7_1de7]
signal n16_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1306_c30_7506]
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_7317]
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1308_c7_2d5f]
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_2d5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_2d5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_2d5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_2d5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1308_c7_2d5f]
signal n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1309_c3_90f7]
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1313_c21_5ca7]
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1313_c21_16cf]
signal MUX_uxn_opcodes_h_l1313_c21_16cf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_16cf_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_16cf_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_16cf_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_left,
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_right,
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

-- n16_MUX_uxn_opcodes_h_l1278_c2_16e0
n16_MUX_uxn_opcodes_h_l1278_c2_16e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond,
n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue,
n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse,
n16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

-- t16_MUX_uxn_opcodes_h_l1278_c2_16e0
t16_MUX_uxn_opcodes_h_l1278_c2_16e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond,
t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue,
t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse,
t16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_left,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_right,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output);

-- n16_MUX_uxn_opcodes_h_l1291_c7_f5e0
n16_MUX_uxn_opcodes_h_l1291_c7_f5e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond,
n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue,
n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse,
n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output);

-- t16_MUX_uxn_opcodes_h_l1291_c7_f5e0
t16_MUX_uxn_opcodes_h_l1291_c7_f5e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond,
t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue,
t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse,
t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_left,
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_right,
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_cond,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_return_output);

-- n16_MUX_uxn_opcodes_h_l1294_c7_8309
n16_MUX_uxn_opcodes_h_l1294_c7_8309 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1294_c7_8309_cond,
n16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue,
n16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse,
n16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output);

-- t16_MUX_uxn_opcodes_h_l1294_c7_8309
t16_MUX_uxn_opcodes_h_l1294_c7_8309 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1294_c7_8309_cond,
t16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue,
t16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse,
t16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_left,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_right,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_cond,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_return_output);

-- n16_MUX_uxn_opcodes_h_l1299_c7_5464
n16_MUX_uxn_opcodes_h_l1299_c7_5464 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1299_c7_5464_cond,
n16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue,
n16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse,
n16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output);

-- t16_MUX_uxn_opcodes_h_l1299_c7_5464
t16_MUX_uxn_opcodes_h_l1299_c7_5464 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1299_c7_5464_cond,
t16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue,
t16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse,
t16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1
BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_left,
BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_right,
BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_left,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_right,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output);

-- n16_MUX_uxn_opcodes_h_l1303_c7_1de7
n16_MUX_uxn_opcodes_h_l1303_c7_1de7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1303_c7_1de7_cond,
n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue,
n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse,
n16_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1306_c30_7506
sp_relative_shift_uxn_opcodes_h_l1306_c30_7506 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_ins,
sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_x,
sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_y,
sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_left,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_right,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output);

-- n16_MUX_uxn_opcodes_h_l1308_c7_2d5f
n16_MUX_uxn_opcodes_h_l1308_c7_2d5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond,
n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue,
n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse,
n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7
BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_left,
BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_right,
BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_left,
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_right,
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_return_output);

-- MUX_uxn_opcodes_h_l1313_c21_16cf
MUX_uxn_opcodes_h_l1313_c21_16cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1313_c21_16cf_cond,
MUX_uxn_opcodes_h_l1313_c21_16cf_iftrue,
MUX_uxn_opcodes_h_l1313_c21_16cf_iffalse,
MUX_uxn_opcodes_h_l1313_c21_16cf_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936
CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
 n16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
 t16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output,
 n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output,
 t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_return_output,
 n16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output,
 t16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_return_output,
 n16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output,
 t16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output,
 n16_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output,
 sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output,
 n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_return_output,
 MUX_uxn_opcodes_h_l1313_c21_16cf_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_0c70 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_344d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_7fa0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_6902 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_a34f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_e298 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_011a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1278_l1308_DUPLICATE_bf58_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_b1bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1299_l1291_l1294_l1308_DUPLICATE_26bb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_13f8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1300_l1309_l1304_DUPLICATE_36b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1303_l1308_DUPLICATE_aed2_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1317_l1274_DUPLICATE_7d09_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_7fa0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_7fa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_344d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_344d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_e298 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_e298;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_6902 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_6902;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_011a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_011a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_0c70 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_0c70;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_a34f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_a34f;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse := t16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1303_l1308_DUPLICATE_aed2 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1303_l1308_DUPLICATE_aed2_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_ac27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_left;
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output := BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_b1bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_b1bc_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1278_c6_ed92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_left;
     BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output := BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1306_c30_7506] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_ins;
     sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_x;
     sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_return_output := sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1300_l1309_l1304_DUPLICATE_36b0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1300_l1309_l1304_DUPLICATE_36b0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_1c6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_7317] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_left;
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output := BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1294_c11_2de1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1278_l1308_DUPLICATE_bf58 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1278_l1308_DUPLICATE_bf58_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1299_l1291_l1294_l1308_DUPLICATE_26bb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1299_l1291_l1294_l1308_DUPLICATE_26bb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_5fc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_13f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_13f8_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_ed92_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_ac27_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_2de1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_1c6c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_5fc3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_7317_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1300_l1309_l1304_DUPLICATE_36b0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1300_l1309_l1304_DUPLICATE_36b0_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1300_l1309_l1304_DUPLICATE_36b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1299_l1291_l1294_l1308_DUPLICATE_26bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1299_l1291_l1294_l1308_DUPLICATE_26bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1299_l1291_l1294_l1308_DUPLICATE_26bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1299_l1291_l1294_l1308_DUPLICATE_26bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_13f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_13f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_13f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_13f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_13f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_b1bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_b1bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_b1bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_b1bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1308_DUPLICATE_b1bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1303_l1308_DUPLICATE_aed2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1303_l1308_DUPLICATE_aed2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1278_l1308_DUPLICATE_bf58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1278_l1308_DUPLICATE_bf58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1278_l1308_DUPLICATE_bf58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1278_l1308_DUPLICATE_bf58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1278_l1308_DUPLICATE_bf58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1299_l1294_l1291_l1278_l1308_DUPLICATE_bf58_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_16e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_7506_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_2d5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1309_c3_90f7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_left;
     BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_return_output := BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_2d5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_2d5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_2d5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1300_c3_cda1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_left;
     BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_return_output := BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_cda1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_90f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1305_l1296_DUPLICATE_c936_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1308_c7_2d5f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond;
     n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue;
     n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output := n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_1de7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1299_c7_5464] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1299_c7_5464_cond <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_cond;
     t16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue;
     t16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output := t16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_1de7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_1de7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_1de7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1313_c21_5ca7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_5ca7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;
     -- MUX[uxn_opcodes_h_l1313_c21_16cf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1313_c21_16cf_cond <= VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_cond;
     MUX_uxn_opcodes_h_l1313_c21_16cf_iftrue <= VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_iftrue;
     MUX_uxn_opcodes_h_l1313_c21_16cf_iffalse <= VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_return_output := MUX_uxn_opcodes_h_l1313_c21_16cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_5464] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;

     -- t16_MUX[uxn_opcodes_h_l1294_c7_8309] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1294_c7_8309_cond <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_cond;
     t16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue;
     t16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output := t16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_5464] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;

     -- n16_MUX[uxn_opcodes_h_l1303_c7_1de7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1303_c7_1de7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_cond;
     n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue;
     n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output := n16_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_5464] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_5464] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue := VAR_MUX_uxn_opcodes_h_l1313_c21_16cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c7_8309] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;

     -- n16_MUX[uxn_opcodes_h_l1299_c7_5464] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1299_c7_5464_cond <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_cond;
     n16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue;
     n16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output := n16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1308_c7_2d5f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c7_8309] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c7_8309] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;

     -- t16_MUX[uxn_opcodes_h_l1291_c7_f5e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond;
     t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue;
     t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output := t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c7_8309] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_2d5f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;
     -- t16_MUX[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond;
     t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue;
     t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output := t16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_f5e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_f5e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1294_c7_8309] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1294_c7_8309_cond <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_cond;
     n16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue;
     n16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output := n16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_1de7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_f5e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_f5e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_1de7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1291_c7_f5e0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond;
     n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue;
     n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output := n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1299_c7_5464] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_return_output := result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5464_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1294_c7_8309] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_return_output := result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;

     -- n16_MUX[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_cond;
     n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue;
     n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output := n16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_8309_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1291_c7_f5e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_f5e0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1278_c2_16e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1317_l1274_DUPLICATE_7d09 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1317_l1274_DUPLICATE_7d09_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_16e0_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1317_l1274_DUPLICATE_7d09_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1317_l1274_DUPLICATE_7d09_return_output;
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
