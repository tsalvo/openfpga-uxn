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
-- BIN_OP_EQ[uxn_opcodes_h_l1278_c6_33bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1278_c2_e5cb]
signal n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1278_c2_e5cb]
signal t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1278_c2_e5cb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1278_c2_e5cb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c2_e5cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1278_c2_e5cb]
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c2_e5cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c2_e5cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1278_c2_e5cb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1278_c2_e5cb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c2_e5cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_9e97]
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1291_c7_5b68]
signal n16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1291_c7_5b68]
signal t16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1291_c7_5b68]
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_5b68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_5b68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_5b68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_5b68]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1294_c11_9e8f]
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1294_c7_215c]
signal n16_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1294_c7_215c]
signal t16_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1294_c7_215c]
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c7_215c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c7_215c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c7_215c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c7_215c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_7a10]
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1299_c7_19f2]
signal n16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1299_c7_19f2]
signal t16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1299_c7_19f2]
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_19f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_19f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_19f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_19f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1300_c3_bcaf]
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_dafa]
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1303_c7_57e9]
signal n16_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_57e9]
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_57e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_57e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_57e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_57e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1306_c30_0713]
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_da60]
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1308_c7_49a7]
signal n16_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1308_c7_49a7]
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_49a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_49a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_49a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_49a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1309_c3_5cfa]
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1313_c21_cfa8]
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1313_c21_3d5d]
signal MUX_uxn_opcodes_h_l1313_c21_3d5d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_3d5d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_3d5d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_3d5d_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output);

-- n16_MUX_uxn_opcodes_h_l1278_c2_e5cb
n16_MUX_uxn_opcodes_h_l1278_c2_e5cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond,
n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue,
n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse,
n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

-- t16_MUX_uxn_opcodes_h_l1278_c2_e5cb
t16_MUX_uxn_opcodes_h_l1278_c2_e5cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond,
t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue,
t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse,
t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_left,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_right,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output);

-- n16_MUX_uxn_opcodes_h_l1291_c7_5b68
n16_MUX_uxn_opcodes_h_l1291_c7_5b68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond,
n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue,
n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse,
n16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output);

-- t16_MUX_uxn_opcodes_h_l1291_c7_5b68
t16_MUX_uxn_opcodes_h_l1291_c7_5b68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond,
t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue,
t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse,
t16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_cond,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_left,
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_right,
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output);

-- n16_MUX_uxn_opcodes_h_l1294_c7_215c
n16_MUX_uxn_opcodes_h_l1294_c7_215c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1294_c7_215c_cond,
n16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue,
n16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse,
n16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output);

-- t16_MUX_uxn_opcodes_h_l1294_c7_215c
t16_MUX_uxn_opcodes_h_l1294_c7_215c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1294_c7_215c_cond,
t16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue,
t16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse,
t16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_left,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_right,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output);

-- n16_MUX_uxn_opcodes_h_l1299_c7_19f2
n16_MUX_uxn_opcodes_h_l1299_c7_19f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond,
n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue,
n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse,
n16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output);

-- t16_MUX_uxn_opcodes_h_l1299_c7_19f2
t16_MUX_uxn_opcodes_h_l1299_c7_19f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond,
t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue,
t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse,
t16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf
BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_left,
BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_right,
BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_left,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_right,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output);

-- n16_MUX_uxn_opcodes_h_l1303_c7_57e9
n16_MUX_uxn_opcodes_h_l1303_c7_57e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1303_c7_57e9_cond,
n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue,
n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse,
n16_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1306_c30_0713
sp_relative_shift_uxn_opcodes_h_l1306_c30_0713 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_ins,
sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_x,
sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_y,
sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_left,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_right,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output);

-- n16_MUX_uxn_opcodes_h_l1308_c7_49a7
n16_MUX_uxn_opcodes_h_l1308_c7_49a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1308_c7_49a7_cond,
n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue,
n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse,
n16_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa
BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_left,
BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_right,
BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_left,
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_right,
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_return_output);

-- MUX_uxn_opcodes_h_l1313_c21_3d5d
MUX_uxn_opcodes_h_l1313_c21_3d5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1313_c21_3d5d_cond,
MUX_uxn_opcodes_h_l1313_c21_3d5d_iftrue,
MUX_uxn_opcodes_h_l1313_c21_3d5d_iffalse,
MUX_uxn_opcodes_h_l1313_c21_3d5d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output,
 n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
 t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output,
 n16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output,
 t16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output,
 n16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output,
 t16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output,
 n16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output,
 t16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output,
 n16_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output,
 sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output,
 n16_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_return_output,
 MUX_uxn_opcodes_h_l1313_c21_3d5d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_9ba4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_086d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_7bf5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_bc66 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_b67c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_a2fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_7ee0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1308_l1303_l1299_l1294_l1291_DUPLICATE_765c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_400f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_00de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_f41c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1309_l1304_l1300_DUPLICATE_f39f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1303_DUPLICATE_91cb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1317_l1274_DUPLICATE_77b9_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_b67c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_b67c;
     VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_a2fe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_a2fe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_9ba4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_9ba4;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_7ee0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_7ee0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_086d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_086d;
     VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_bc66 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_bc66;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_7bf5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_7bf5;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_7a10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1294_c11_9e8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_400f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_400f_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1303_DUPLICATE_91cb LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1303_DUPLICATE_91cb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1308_l1303_l1299_l1294_l1291_DUPLICATE_765c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1308_l1303_l1299_l1294_l1291_DUPLICATE_765c_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_f41c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_f41c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_00de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_00de_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_9e97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_left;
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output := BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1278_c6_33bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1306_c30_0713] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_ins;
     sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_x;
     sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_return_output := sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1309_l1304_l1300_DUPLICATE_f39f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1309_l1304_l1300_DUPLICATE_f39f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_dafa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_da60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_33bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_9e97_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_9e8f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_7a10_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_dafa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_da60_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1309_l1304_l1300_DUPLICATE_f39f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1309_l1304_l1300_DUPLICATE_f39f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1309_l1304_l1300_DUPLICATE_f39f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_f41c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_f41c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_f41c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_f41c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_400f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_400f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_400f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_400f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_400f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_00de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_00de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_00de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_00de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1303_l1299_l1294_l1291_DUPLICATE_00de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1303_DUPLICATE_91cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1303_DUPLICATE_91cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1308_l1303_l1299_l1294_l1291_DUPLICATE_765c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1308_l1303_l1299_l1294_l1291_DUPLICATE_765c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1308_l1303_l1299_l1294_l1291_DUPLICATE_765c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1308_l1303_l1299_l1294_l1291_DUPLICATE_765c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1308_l1303_l1299_l1294_l1291_DUPLICATE_765c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1308_l1303_l1299_l1294_l1291_DUPLICATE_765c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_e5cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_0713_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_49a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_49a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1309_c3_5cfa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_left;
     BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_return_output := BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1300_c3_bcaf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_left;
     BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_return_output := BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_49a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_49a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_bcaf_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_5cfa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_fca9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;
     -- t16_MUX[uxn_opcodes_h_l1299_c7_19f2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond;
     t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue;
     t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output := t16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_57e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1308_c7_49a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1308_c7_49a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_cond;
     n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue;
     n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output := n16_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_57e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_57e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_57e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1313_c21_cfa8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_cfa8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_19f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1294_c7_215c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1294_c7_215c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_cond;
     t16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue;
     t16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output := t16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_19f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_19f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1303_c7_57e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1303_c7_57e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_cond;
     n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue;
     n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output := n16_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_19f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;

     -- MUX[uxn_opcodes_h_l1313_c21_3d5d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1313_c21_3d5d_cond <= VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_cond;
     MUX_uxn_opcodes_h_l1313_c21_3d5d_iftrue <= VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_iftrue;
     MUX_uxn_opcodes_h_l1313_c21_3d5d_iffalse <= VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_return_output := MUX_uxn_opcodes_h_l1313_c21_3d5d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue := VAR_MUX_uxn_opcodes_h_l1313_c21_3d5d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c7_215c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c7_215c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1299_c7_19f2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_cond;
     n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue;
     n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output := n16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c7_215c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c7_215c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1308_c7_49a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1291_c7_5b68] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond;
     t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue;
     t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output := t16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_49a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_5b68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_5b68] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_5b68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_5b68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;

     -- n16_MUX[uxn_opcodes_h_l1294_c7_215c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1294_c7_215c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_cond;
     n16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue;
     n16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output := n16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_57e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond;
     t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue;
     t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output := t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_57e9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1291_c7_5b68] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_cond;
     n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue;
     n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output := n16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1299_c7_19f2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_19f2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1294_c7_215c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond;
     n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue;
     n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output := n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_215c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1291_c7_5b68] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output := result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_5b68_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1278_c2_e5cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1317_l1274_DUPLICATE_77b9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1317_l1274_DUPLICATE_77b9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_e5cb_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1317_l1274_DUPLICATE_77b9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1317_l1274_DUPLICATE_77b9_return_output;
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
