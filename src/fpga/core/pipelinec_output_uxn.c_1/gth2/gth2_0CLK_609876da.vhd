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
entity gth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_609876da;
architecture arch of gth2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_5614]
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_8873]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_8873]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_8873]
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_8873]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_8873]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_8873]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_8873]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_8873]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_8873]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1844_c2_8873]
signal t16_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1844_c2_8873]
signal n16_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_642e]
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_1bdd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_1bdd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_1bdd]
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_1bdd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_1bdd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1857_c7_1bdd]
signal t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1857_c7_1bdd]
signal n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_b546]
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_2d3e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_2d3e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_2d3e]
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_2d3e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_2d3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1860_c7_2d3e]
signal t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1860_c7_2d3e]
signal n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_a574]
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_58ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_58ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_58ba]
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_58ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_58ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1865_c7_58ba]
signal t16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1865_c7_58ba]
signal n16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1866_c3_d399]
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_4d84]
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_b121]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_b121]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_b121]
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_b121]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_b121]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1869_c7_b121]
signal n16_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_80f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_fd37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_fd37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_fd37]
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_fd37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_fd37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1873_c7_fd37]
signal n16_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1874_c3_404c]
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1875_c30_8b17]
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1878_c21_5b9b]
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1878_c21_651c]
signal MUX_uxn_opcodes_h_l1878_c21_651c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_651c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_651c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_651c_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_left,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_right,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_cond,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

-- t16_MUX_uxn_opcodes_h_l1844_c2_8873
t16_MUX_uxn_opcodes_h_l1844_c2_8873 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1844_c2_8873_cond,
t16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue,
t16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse,
t16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

-- n16_MUX_uxn_opcodes_h_l1844_c2_8873
n16_MUX_uxn_opcodes_h_l1844_c2_8873 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1844_c2_8873_cond,
n16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue,
n16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse,
n16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_left,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_right,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output);

-- t16_MUX_uxn_opcodes_h_l1857_c7_1bdd
t16_MUX_uxn_opcodes_h_l1857_c7_1bdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond,
t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue,
t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse,
t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output);

-- n16_MUX_uxn_opcodes_h_l1857_c7_1bdd
n16_MUX_uxn_opcodes_h_l1857_c7_1bdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond,
n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue,
n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse,
n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_left,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_right,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output);

-- t16_MUX_uxn_opcodes_h_l1860_c7_2d3e
t16_MUX_uxn_opcodes_h_l1860_c7_2d3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond,
t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue,
t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse,
t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output);

-- n16_MUX_uxn_opcodes_h_l1860_c7_2d3e
n16_MUX_uxn_opcodes_h_l1860_c7_2d3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond,
n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue,
n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse,
n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_left,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_right,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_cond,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output);

-- t16_MUX_uxn_opcodes_h_l1865_c7_58ba
t16_MUX_uxn_opcodes_h_l1865_c7_58ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond,
t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue,
t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse,
t16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output);

-- n16_MUX_uxn_opcodes_h_l1865_c7_58ba
n16_MUX_uxn_opcodes_h_l1865_c7_58ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond,
n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue,
n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse,
n16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399
BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_left,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_right,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_left,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_right,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_cond,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_return_output);

-- n16_MUX_uxn_opcodes_h_l1869_c7_b121
n16_MUX_uxn_opcodes_h_l1869_c7_b121 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1869_c7_b121_cond,
n16_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue,
n16_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse,
n16_MUX_uxn_opcodes_h_l1869_c7_b121_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_cond,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output);

-- n16_MUX_uxn_opcodes_h_l1873_c7_fd37
n16_MUX_uxn_opcodes_h_l1873_c7_fd37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1873_c7_fd37_cond,
n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue,
n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse,
n16_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c
BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_left,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_right,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17
sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_ins,
sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_x,
sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_y,
sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b
BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_left,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_right,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_return_output);

-- MUX_uxn_opcodes_h_l1878_c21_651c
MUX_uxn_opcodes_h_l1878_c21_651c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1878_c21_651c_cond,
MUX_uxn_opcodes_h_l1878_c21_651c_iftrue,
MUX_uxn_opcodes_h_l1878_c21_651c_iffalse,
MUX_uxn_opcodes_h_l1878_c21_651c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
 t16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
 n16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output,
 t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output,
 n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output,
 t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output,
 n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output,
 t16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output,
 n16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_return_output,
 n16_MUX_uxn_opcodes_h_l1869_c7_b121_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output,
 n16_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_return_output,
 MUX_uxn_opcodes_h_l1878_c21_651c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_69a8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_5dd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_c734 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_5553 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_6040 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_c0bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_651c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_651c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_651c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_651c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_e3fb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7386_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7cda_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_78b6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1870_l1866_l1861_l1874_DUPLICATE_afe3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_bfa5_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1882_l1840_DUPLICATE_21b9_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_c0bc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_c0bc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1878_c21_651c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_69a8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_69a8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_5dd2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_5dd2;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_5553 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_5553;
     VAR_MUX_uxn_opcodes_h_l1878_c21_651c_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_c734 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_c734;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_6040 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_6040;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7cda LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7cda_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_8873_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_5614] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_left;
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output := BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_4d84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7386 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7386_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_bfa5 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_bfa5_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_8873_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_80f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_8873_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_e3fb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_e3fb_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1870_l1866_l1861_l1874_DUPLICATE_afe3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1870_l1866_l1861_l1874_DUPLICATE_afe3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1875_c30_8b17] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_ins;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_x;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_return_output := sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_8873_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_b546] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_left;
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output := BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_78b6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_78b6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_a574] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_left;
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output := BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_642e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_5614_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_642e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_b546_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_a574_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_4d84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_80f1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1870_l1866_l1861_l1874_DUPLICATE_afe3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1870_l1866_l1861_l1874_DUPLICATE_afe3_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1870_l1866_l1861_l1874_DUPLICATE_afe3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7386_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7386_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7386_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7386_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7386_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_78b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_78b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_78b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_78b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_78b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7cda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7cda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7cda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7cda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_7cda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_bfa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_bfa5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_e3fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_e3fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_e3fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_e3fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_e3fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_e3fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_8873_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_8873_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_8873_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_8873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_8b17_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_fd37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1866_c3_d399] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_left;
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_return_output := BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1874_c3_404c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_left;
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_return_output := BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_fd37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_fd37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_fd37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_d399_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_404c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_4ddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_b121] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;

     -- n16_MUX[uxn_opcodes_h_l1873_c7_fd37] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1873_c7_fd37_cond <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_cond;
     n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue;
     n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output := n16_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_b121] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_b121] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;

     -- t16_MUX[uxn_opcodes_h_l1865_c7_58ba] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond;
     t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue;
     t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output := t16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1878_c21_5b9b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_left;
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_return_output := BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_b121] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1878_c21_651c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_5b9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_58ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;

     -- MUX[uxn_opcodes_h_l1878_c21_651c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1878_c21_651c_cond <= VAR_MUX_uxn_opcodes_h_l1878_c21_651c_cond;
     MUX_uxn_opcodes_h_l1878_c21_651c_iftrue <= VAR_MUX_uxn_opcodes_h_l1878_c21_651c_iftrue;
     MUX_uxn_opcodes_h_l1878_c21_651c_iffalse <= VAR_MUX_uxn_opcodes_h_l1878_c21_651c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1878_c21_651c_return_output := MUX_uxn_opcodes_h_l1878_c21_651c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1860_c7_2d3e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond;
     t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue;
     t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output := t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_58ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_58ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;

     -- n16_MUX[uxn_opcodes_h_l1869_c7_b121] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1869_c7_b121_cond <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_cond;
     n16_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue;
     n16_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_return_output := n16_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_58ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue := VAR_MUX_uxn_opcodes_h_l1878_c21_651c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_2d3e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_2d3e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1865_c7_58ba] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_cond;
     n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue;
     n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output := n16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;

     -- t16_MUX[uxn_opcodes_h_l1857_c7_1bdd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond;
     t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue;
     t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output := t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_2d3e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_fd37] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output := result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_2d3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_fd37_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;
     -- n16_MUX[uxn_opcodes_h_l1860_c7_2d3e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond;
     n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue;
     n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output := n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_1bdd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_b121] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_return_output := result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_1bdd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_1bdd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1844_c2_8873_cond <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_cond;
     t16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue;
     t16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output := t16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_1bdd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_b121_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;

     -- n16_MUX[uxn_opcodes_h_l1857_c7_1bdd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond;
     n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue;
     n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output := n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_58ba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output := result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_58ba_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_2d3e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1844_c2_8873_cond <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_cond;
     n16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue;
     n16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output := n16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_2d3e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_1bdd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_1bdd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_8873] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_return_output := result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1882_l1840_DUPLICATE_21b9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1882_l1840_DUPLICATE_21b9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_8873_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_8873_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1882_l1840_DUPLICATE_21b9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1882_l1840_DUPLICATE_21b9_return_output;
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
