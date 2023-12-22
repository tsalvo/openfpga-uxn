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
entity lth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_609876da;
architecture arch of lth2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1942_c6_13c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1942_c2_c8d7]
signal n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1942_c2_c8d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1942_c2_c8d7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1942_c2_c8d7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1942_c2_c8d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1942_c2_c8d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1942_c2_c8d7]
signal result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1942_c2_c8d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1942_c2_c8d7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1942_c2_c8d7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1942_c2_c8d7]
signal t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1955_c11_2520]
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1955_c7_47fa]
signal n16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1955_c7_47fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1955_c7_47fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1955_c7_47fa]
signal result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1955_c7_47fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1955_c7_47fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1955_c7_47fa]
signal t16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1958_c11_0e89]
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1958_c7_3b5c]
signal n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1958_c7_3b5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1958_c7_3b5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1958_c7_3b5c]
signal result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1958_c7_3b5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1958_c7_3b5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1958_c7_3b5c]
signal t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_80b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1963_c7_8b63]
signal n16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_8b63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_8b63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1963_c7_8b63]
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_8b63]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_8b63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1963_c7_8b63]
signal t16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1964_c3_1fdc]
signal BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1967_c11_1b29]
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1967_c7_dc28]
signal n16_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1967_c7_dc28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1967_c7_dc28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1967_c7_dc28]
signal result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1967_c7_dc28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1967_c7_dc28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1971_c11_8c5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1971_c7_e2ef]
signal n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1971_c7_e2ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1971_c7_e2ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1971_c7_e2ef]
signal result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1971_c7_e2ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1971_c7_e2ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1972_c3_4c53]
signal BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1973_c30_274d]
signal sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1976_c21_a926]
signal BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1976_c21_43e2]
signal MUX_uxn_opcodes_h_l1976_c21_43e2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1976_c21_43e2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1976_c21_43e2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1976_c21_43e2_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1
BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output);

-- n16_MUX_uxn_opcodes_h_l1942_c2_c8d7
n16_MUX_uxn_opcodes_h_l1942_c2_c8d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond,
n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue,
n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse,
n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7
result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7
result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7
result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7
result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

-- t16_MUX_uxn_opcodes_h_l1942_c2_c8d7
t16_MUX_uxn_opcodes_h_l1942_c2_c8d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond,
t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue,
t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse,
t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520
BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_left,
BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_right,
BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output);

-- n16_MUX_uxn_opcodes_h_l1955_c7_47fa
n16_MUX_uxn_opcodes_h_l1955_c7_47fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond,
n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue,
n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse,
n16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa
result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output);

-- t16_MUX_uxn_opcodes_h_l1955_c7_47fa
t16_MUX_uxn_opcodes_h_l1955_c7_47fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond,
t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue,
t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse,
t16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_left,
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_right,
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output);

-- n16_MUX_uxn_opcodes_h_l1958_c7_3b5c
n16_MUX_uxn_opcodes_h_l1958_c7_3b5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond,
n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue,
n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse,
n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c
result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output);

-- t16_MUX_uxn_opcodes_h_l1958_c7_3b5c
t16_MUX_uxn_opcodes_h_l1958_c7_3b5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond,
t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue,
t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse,
t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output);

-- n16_MUX_uxn_opcodes_h_l1963_c7_8b63
n16_MUX_uxn_opcodes_h_l1963_c7_8b63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond,
n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue,
n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse,
n16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_cond,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output);

-- t16_MUX_uxn_opcodes_h_l1963_c7_8b63
t16_MUX_uxn_opcodes_h_l1963_c7_8b63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond,
t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue,
t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse,
t16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc
BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_left,
BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_right,
BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_left,
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_right,
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output);

-- n16_MUX_uxn_opcodes_h_l1967_c7_dc28
n16_MUX_uxn_opcodes_h_l1967_c7_dc28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1967_c7_dc28_cond,
n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue,
n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse,
n16_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28
result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_cond,
result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output);

-- n16_MUX_uxn_opcodes_h_l1971_c7_e2ef
n16_MUX_uxn_opcodes_h_l1971_c7_e2ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond,
n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue,
n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse,
n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef
result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53
BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_left,
BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_right,
BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1973_c30_274d
sp_relative_shift_uxn_opcodes_h_l1973_c30_274d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_ins,
sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_x,
sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_y,
sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926
BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_left,
BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_right,
BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_return_output);

-- MUX_uxn_opcodes_h_l1976_c21_43e2
MUX_uxn_opcodes_h_l1976_c21_43e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1976_c21_43e2_cond,
MUX_uxn_opcodes_h_l1976_c21_43e2_iftrue,
MUX_uxn_opcodes_h_l1976_c21_43e2_iffalse,
MUX_uxn_opcodes_h_l1976_c21_43e2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48
CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output,
 n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
 t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output,
 n16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output,
 t16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output,
 n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output,
 t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output,
 n16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output,
 t16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output,
 n16_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output,
 n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_return_output,
 sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_return_output,
 MUX_uxn_opcodes_h_l1976_c21_43e2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_d28d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1947_c3_06ef : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_7319 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_37cc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_a7d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1975_c3_43c9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1942_l1971_DUPLICATE_2de4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_9892_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_52ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_0cb3_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1968_l1972_l1959_DUPLICATE_f550_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1967_l1971_DUPLICATE_1b3a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1938_l1980_DUPLICATE_5001_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_7319 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_7319;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_37cc := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_37cc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_a7d3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_a7d3;
     VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_d28d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_d28d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1975_c3_43c9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1975_c3_43c9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1947_c3_06ef := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1947_c3_06ef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_80b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_0cb3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_0cb3_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1942_l1971_DUPLICATE_2de4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1942_l1971_DUPLICATE_2de4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1958_c11_0e89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_left;
     BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output := BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1971_c11_8c5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1942_c6_13c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1967_c11_1b29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_left;
     BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output := BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_9892 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_9892_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1955_c11_2520] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_left;
     BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output := BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1968_l1972_l1959_DUPLICATE_f550 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1968_l1972_l1959_DUPLICATE_f550_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1973_c30_274d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_ins;
     sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_x;
     sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_return_output := sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_52ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_52ff_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1967_l1971_DUPLICATE_1b3a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1967_l1971_DUPLICATE_1b3a_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c6_13c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c11_2520_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_0e89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_80b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_1b29_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_8c5b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1968_l1972_l1959_DUPLICATE_f550_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1968_l1972_l1959_DUPLICATE_f550_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1968_l1972_l1959_DUPLICATE_f550_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_0cb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_0cb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_0cb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_0cb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_0cb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_9892_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_9892_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_9892_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_9892_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_9892_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_52ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_52ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_52ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_52ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1971_DUPLICATE_52ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1967_l1971_DUPLICATE_1b3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1967_l1971_DUPLICATE_1b3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1942_l1971_DUPLICATE_2de4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1942_l1971_DUPLICATE_2de4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1942_l1971_DUPLICATE_2de4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1942_l1971_DUPLICATE_2de4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1942_l1971_DUPLICATE_2de4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1967_l1963_l1958_l1955_l1942_l1971_DUPLICATE_2de4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1942_c2_c8d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1973_c30_274d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1971_c7_e2ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1971_c7_e2ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1971_c7_e2ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1964_c3_1fdc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_left;
     BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_return_output := BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1972_c3_4c53] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_left;
     BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_return_output := BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1971_c7_e2ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1964_c3_1fdc_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_4c53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1960_l1969_DUPLICATE_1b48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1967_c7_dc28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;

     -- t16_MUX[uxn_opcodes_h_l1963_c7_8b63] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond;
     t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue;
     t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output := t16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;

     -- n16_MUX[uxn_opcodes_h_l1971_c7_e2ef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond <= VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond;
     n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue;
     n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output := n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1967_c7_dc28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1967_c7_dc28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1967_c7_dc28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1976_c21_a926] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_left;
     BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_return_output := BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1976_c21_a926_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_8b63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_8b63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_8b63] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;

     -- t16_MUX[uxn_opcodes_h_l1958_c7_3b5c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond;
     t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue;
     t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output := t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;

     -- MUX[uxn_opcodes_h_l1976_c21_43e2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1976_c21_43e2_cond <= VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_cond;
     MUX_uxn_opcodes_h_l1976_c21_43e2_iftrue <= VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_iftrue;
     MUX_uxn_opcodes_h_l1976_c21_43e2_iffalse <= VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_return_output := MUX_uxn_opcodes_h_l1976_c21_43e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1967_c7_dc28] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1967_c7_dc28_cond <= VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_cond;
     n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue;
     n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output := n16_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_8b63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue := VAR_MUX_uxn_opcodes_h_l1976_c21_43e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1958_c7_3b5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1958_c7_3b5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1955_c7_47fa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond;
     t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue;
     t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output := t16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1971_c7_e2ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1958_c7_3b5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1958_c7_3b5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1963_c7_8b63] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_cond;
     n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue;
     n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output := n16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_e2ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1955_c7_47fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1955_c7_47fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1955_c7_47fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1967_c7_dc28] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output := result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;

     -- t16_MUX[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond;
     t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue;
     t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output := t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1958_c7_3b5c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond;
     n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue;
     n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output := n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1955_c7_47fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1967_c7_dc28_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1963_c7_8b63] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output := result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1955_c7_47fa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_cond;
     n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue;
     n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output := n16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_8b63_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1958_c7_3b5c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond;
     n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue;
     n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output := n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1958_c7_3b5c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1955_c7_47fa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c7_47fa_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1942_c2_c8d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1938_l1980_DUPLICATE_5001 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1938_l1980_DUPLICATE_5001_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1942_c2_c8d7_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1938_l1980_DUPLICATE_5001_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1938_l1980_DUPLICATE_5001_return_output;
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
