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
-- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_f4db]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_fa36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_fa36]
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_fa36]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_fa36]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_fa36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_fa36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_fa36]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_fa36]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_fa36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1277_c2_fa36]
signal t16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1277_c2_fa36]
signal n16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_4383]
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_0748]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_0748]
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_0748]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_0748]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_0748]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1290_c7_0748]
signal t16_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1290_c7_0748]
signal n16_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_0bec]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_ccf8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_ccf8]
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_ccf8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_ccf8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_ccf8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1293_c7_ccf8]
signal t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1293_c7_ccf8]
signal n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_2c7e]
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_f3d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_f3d9]
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_f3d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_f3d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_f3d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1298_c7_f3d9]
signal t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1298_c7_f3d9]
signal n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1299_c3_1dba]
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_549f]
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_8cf3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_8cf3]
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_8cf3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_8cf3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_8cf3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1302_c7_8cf3]
signal n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1305_c30_197a]
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_43ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_7c18]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_7c18]
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_7c18]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_7c18]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_7c18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_7c18]
signal n16_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1308_c3_6225]
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_d740]
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1312_c21_e863]
signal MUX_uxn_opcodes_h_l1312_c21_e863_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_e863_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_e863_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_e863_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_cond,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

-- t16_MUX_uxn_opcodes_h_l1277_c2_fa36
t16_MUX_uxn_opcodes_h_l1277_c2_fa36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond,
t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue,
t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse,
t16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

-- n16_MUX_uxn_opcodes_h_l1277_c2_fa36
n16_MUX_uxn_opcodes_h_l1277_c2_fa36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond,
n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue,
n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse,
n16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_left,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_right,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_cond,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_return_output);

-- t16_MUX_uxn_opcodes_h_l1290_c7_0748
t16_MUX_uxn_opcodes_h_l1290_c7_0748 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1290_c7_0748_cond,
t16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue,
t16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse,
t16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output);

-- n16_MUX_uxn_opcodes_h_l1290_c7_0748
n16_MUX_uxn_opcodes_h_l1290_c7_0748 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1290_c7_0748_cond,
n16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue,
n16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse,
n16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output);

-- t16_MUX_uxn_opcodes_h_l1293_c7_ccf8
t16_MUX_uxn_opcodes_h_l1293_c7_ccf8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond,
t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue,
t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse,
t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output);

-- n16_MUX_uxn_opcodes_h_l1293_c7_ccf8
n16_MUX_uxn_opcodes_h_l1293_c7_ccf8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond,
n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue,
n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse,
n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_left,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_right,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output);

-- t16_MUX_uxn_opcodes_h_l1298_c7_f3d9
t16_MUX_uxn_opcodes_h_l1298_c7_f3d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond,
t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue,
t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse,
t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output);

-- n16_MUX_uxn_opcodes_h_l1298_c7_f3d9
n16_MUX_uxn_opcodes_h_l1298_c7_f3d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond,
n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue,
n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse,
n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba
BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_left,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_right,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_left,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_right,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output);

-- n16_MUX_uxn_opcodes_h_l1302_c7_8cf3
n16_MUX_uxn_opcodes_h_l1302_c7_8cf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond,
n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue,
n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse,
n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1305_c30_197a
sp_relative_shift_uxn_opcodes_h_l1305_c30_197a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_ins,
sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_x,
sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_y,
sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_cond,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_7c18
n16_MUX_uxn_opcodes_h_l1307_c7_7c18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_7c18_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225
BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_left,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_right,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_left,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_right,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_return_output);

-- MUX_uxn_opcodes_h_l1312_c21_e863
MUX_uxn_opcodes_h_l1312_c21_e863 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1312_c21_e863_cond,
MUX_uxn_opcodes_h_l1312_c21_e863_iftrue,
MUX_uxn_opcodes_h_l1312_c21_e863_iffalse,
MUX_uxn_opcodes_h_l1312_c21_e863_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e
CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
 t16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
 n16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_return_output,
 t16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output,
 n16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output,
 t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output,
 n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output,
 t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output,
 n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output,
 n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_return_output,
 MUX_uxn_opcodes_h_l1312_c21_e863_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_b734 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_bf1b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_633b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_d085 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_e535 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_751c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_78f0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_e863_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_e863_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_e863_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_e863_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_0472_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1d46_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_8409_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_33e8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_9361_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_846b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1273_l1316_DUPLICATE_d979_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_e535 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_e535;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_d085 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_d085;
     VAR_MUX_uxn_opcodes_h_l1312_c21_e863_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_633b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_633b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_b734 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_b734;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_bf1b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_bf1b;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_751c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_751c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1312_c21_e863_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_78f0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_78f0;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l1305_c30_197a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_ins;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_x;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_return_output := sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_8409 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_8409_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_2c7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_f4db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_33e8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_33e8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_0472 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_0472_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_0bec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_43ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_846b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_846b_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1d46 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1d46_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_4383] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_left;
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output := BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_549f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_9361 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_9361_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_f4db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_4383_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0bec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_2c7e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_549f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_43ff_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_9361_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_9361_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_9361_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_8409_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_8409_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_8409_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_8409_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_33e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_33e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_33e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_33e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_33e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1d46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1d46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1d46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1d46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1d46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_846b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_846b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_0472_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_0472_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_0472_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_0472_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_0472_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_0472_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_fa36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_197a_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_7c18] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_7c18] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_7c18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1299_c3_1dba] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_left;
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_return_output := BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1308_c3_6225] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_left;
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_return_output := BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_7c18] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_1dba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_6225_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_7f3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_8cf3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1298_c7_f3d9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond;
     t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue;
     t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output := t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_d740] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_left;
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_return_output := BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_8cf3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_7c18] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_7c18_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_8cf3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_8cf3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1312_c21_e863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_d740_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;
     -- MUX[uxn_opcodes_h_l1312_c21_e863] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1312_c21_e863_cond <= VAR_MUX_uxn_opcodes_h_l1312_c21_e863_cond;
     MUX_uxn_opcodes_h_l1312_c21_e863_iftrue <= VAR_MUX_uxn_opcodes_h_l1312_c21_e863_iftrue;
     MUX_uxn_opcodes_h_l1312_c21_e863_iffalse <= VAR_MUX_uxn_opcodes_h_l1312_c21_e863_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1312_c21_e863_return_output := MUX_uxn_opcodes_h_l1312_c21_e863_return_output;

     -- n16_MUX[uxn_opcodes_h_l1302_c7_8cf3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond;
     n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue;
     n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output := n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_f3d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_f3d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_f3d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_f3d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1293_c7_ccf8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond;
     t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue;
     t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output := t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue := VAR_MUX_uxn_opcodes_h_l1312_c21_e863_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_7c18] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output := result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_ccf8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_ccf8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1298_c7_f3d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond;
     n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue;
     n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output := n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_ccf8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_ccf8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1290_c7_0748] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1290_c7_0748_cond <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_cond;
     t16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue;
     t16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output := t16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_7c18_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_0748] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_0748] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;

     -- t16_MUX[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond;
     t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue;
     t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output := t16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_0748] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_8cf3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1293_c7_ccf8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond;
     n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue;
     n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output := n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_0748] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_8cf3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_f3d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;

     -- n16_MUX[uxn_opcodes_h_l1290_c7_0748] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1290_c7_0748_cond <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_cond;
     n16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue;
     n16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output := n16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_f3d9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_ccf8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_cond;
     n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue;
     n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output := n16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_ccf8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_0748] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_return_output := result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0748_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_fa36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output := result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1273_l1316_DUPLICATE_d979 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1273_l1316_DUPLICATE_d979_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_fa36_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1273_l1316_DUPLICATE_d979_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1273_l1316_DUPLICATE_d979_return_output;
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
