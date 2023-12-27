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
-- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_0d44]
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_6725]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_6725]
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_6725]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_6725]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_6725]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_6725]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_6725]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_6725]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_6725]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1844_c2_6725]
signal t16_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1844_c2_6725]
signal n16_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_92e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_0ca8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_0ca8]
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_0ca8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_0ca8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_0ca8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1857_c7_0ca8]
signal t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1857_c7_0ca8]
signal n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_c7cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_bc78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_bc78]
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_bc78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_bc78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_bc78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1860_c7_bc78]
signal t16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1860_c7_bc78]
signal n16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_009c]
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_1781]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_1781]
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_1781]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_1781]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_1781]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1865_c7_1781]
signal t16_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1865_c7_1781]
signal n16_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1866_c3_387e]
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_2a6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_a26d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_a26d]
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_a26d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_a26d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_a26d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1869_c7_a26d]
signal n16_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_4ed6]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_1fcb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_1fcb]
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_1fcb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_1fcb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_1fcb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1873_c7_1fcb]
signal n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1874_c3_2774]
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1875_c30_f504]
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1878_c21_c2f4]
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1878_c21_c605]
signal MUX_uxn_opcodes_h_l1878_c21_c605_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_c605_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_c605_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_c605_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_left,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_right,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_cond,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

-- t16_MUX_uxn_opcodes_h_l1844_c2_6725
t16_MUX_uxn_opcodes_h_l1844_c2_6725 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1844_c2_6725_cond,
t16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue,
t16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse,
t16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

-- n16_MUX_uxn_opcodes_h_l1844_c2_6725
n16_MUX_uxn_opcodes_h_l1844_c2_6725 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1844_c2_6725_cond,
n16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue,
n16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse,
n16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output);

-- t16_MUX_uxn_opcodes_h_l1857_c7_0ca8
t16_MUX_uxn_opcodes_h_l1857_c7_0ca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond,
t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue,
t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse,
t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output);

-- n16_MUX_uxn_opcodes_h_l1857_c7_0ca8
n16_MUX_uxn_opcodes_h_l1857_c7_0ca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond,
n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue,
n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse,
n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_cond,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output);

-- t16_MUX_uxn_opcodes_h_l1860_c7_bc78
t16_MUX_uxn_opcodes_h_l1860_c7_bc78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond,
t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue,
t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse,
t16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output);

-- n16_MUX_uxn_opcodes_h_l1860_c7_bc78
n16_MUX_uxn_opcodes_h_l1860_c7_bc78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond,
n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue,
n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse,
n16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_left,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_right,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_cond,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_return_output);

-- t16_MUX_uxn_opcodes_h_l1865_c7_1781
t16_MUX_uxn_opcodes_h_l1865_c7_1781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1865_c7_1781_cond,
t16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue,
t16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse,
t16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output);

-- n16_MUX_uxn_opcodes_h_l1865_c7_1781
n16_MUX_uxn_opcodes_h_l1865_c7_1781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1865_c7_1781_cond,
n16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue,
n16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse,
n16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e
BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_left,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_right,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output);

-- n16_MUX_uxn_opcodes_h_l1869_c7_a26d
n16_MUX_uxn_opcodes_h_l1869_c7_a26d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1869_c7_a26d_cond,
n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue,
n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse,
n16_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output);

-- n16_MUX_uxn_opcodes_h_l1873_c7_1fcb
n16_MUX_uxn_opcodes_h_l1873_c7_1fcb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond,
n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue,
n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse,
n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774
BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_left,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_right,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1875_c30_f504
sp_relative_shift_uxn_opcodes_h_l1875_c30_f504 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_ins,
sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_x,
sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_y,
sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4
BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_left,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_right,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_return_output);

-- MUX_uxn_opcodes_h_l1878_c21_c605
MUX_uxn_opcodes_h_l1878_c21_c605 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1878_c21_c605_cond,
MUX_uxn_opcodes_h_l1878_c21_c605_iftrue,
MUX_uxn_opcodes_h_l1878_c21_c605_iffalse,
MUX_uxn_opcodes_h_l1878_c21_c605_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
 t16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
 n16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output,
 t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output,
 n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output,
 t16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output,
 n16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_return_output,
 t16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output,
 n16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output,
 n16_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output,
 n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_return_output,
 sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_return_output,
 MUX_uxn_opcodes_h_l1878_c21_c605_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_4cb2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_841c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_2e91 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_5e6e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_643f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_8dc8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_c605_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_c605_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_c605_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_c605_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_ab8f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_3270_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_0b8a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_53c9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1874_l1870_l1861_l1866_DUPLICATE_c1d2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_c731_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1882_l1840_DUPLICATE_ce41_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_841c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_841c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_8dc8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_8dc8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1878_c21_c605_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_643f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_643f;
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_4cb2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_4cb2;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_5e6e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_5e6e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_2e91 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_2e91;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1878_c21_c605_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_2a6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_92e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_c7cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1875_c30_f504] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_ins;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_x;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_return_output := sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_4ed6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_6725_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_0d44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_left;
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output := BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_6725_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_6725_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_3270 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_3270_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_009c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_0b8a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_0b8a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_c731 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_c731_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_ab8f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_ab8f_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_6725_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1874_l1870_l1861_l1866_DUPLICATE_c1d2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1874_l1870_l1861_l1866_DUPLICATE_c1d2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_53c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_53c9_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_0d44_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_92e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_c7cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_009c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a6a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_4ed6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1874_l1870_l1861_l1866_DUPLICATE_c1d2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1874_l1870_l1861_l1866_DUPLICATE_c1d2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1874_l1870_l1861_l1866_DUPLICATE_c1d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_0b8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_0b8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_0b8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_0b8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_0b8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_53c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_53c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_53c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_53c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_53c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_3270_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_3270_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_3270_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_3270_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_3270_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_c731_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_c731_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_ab8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_ab8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_ab8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_ab8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_ab8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_ab8f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_6725_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_6725_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_6725_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_6725_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_f504_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1874_c3_2774] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_left;
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_return_output := BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_1fcb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_1fcb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1866_c3_387e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_left;
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_return_output := BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_1fcb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_1fcb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_387e_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_2774_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_a853_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;
     -- t16_MUX[uxn_opcodes_h_l1865_c7_1781] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1865_c7_1781_cond <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_cond;
     t16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue;
     t16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output := t16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;

     -- n16_MUX[uxn_opcodes_h_l1873_c7_1fcb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond;
     n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue;
     n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output := n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_a26d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1878_c21_c2f4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_left;
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_return_output := BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_a26d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_a26d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_a26d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1878_c21_c605_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_c2f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_1781] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_1781] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_1781] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_1781] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;

     -- t16_MUX[uxn_opcodes_h_l1860_c7_bc78] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond;
     t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue;
     t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output := t16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;

     -- n16_MUX[uxn_opcodes_h_l1869_c7_a26d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1869_c7_a26d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_cond;
     n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue;
     n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output := n16_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;

     -- MUX[uxn_opcodes_h_l1878_c21_c605] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1878_c21_c605_cond <= VAR_MUX_uxn_opcodes_h_l1878_c21_c605_cond;
     MUX_uxn_opcodes_h_l1878_c21_c605_iftrue <= VAR_MUX_uxn_opcodes_h_l1878_c21_c605_iftrue;
     MUX_uxn_opcodes_h_l1878_c21_c605_iffalse <= VAR_MUX_uxn_opcodes_h_l1878_c21_c605_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1878_c21_c605_return_output := MUX_uxn_opcodes_h_l1878_c21_c605_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue := VAR_MUX_uxn_opcodes_h_l1878_c21_c605_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;
     -- t16_MUX[uxn_opcodes_h_l1857_c7_0ca8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond;
     t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue;
     t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output := t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_bc78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_bc78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_bc78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;

     -- n16_MUX[uxn_opcodes_h_l1865_c7_1781] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1865_c7_1781_cond <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_cond;
     n16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue;
     n16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output := n16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_1fcb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_bc78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_1fcb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_0ca8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1860_c7_bc78] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_cond;
     n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue;
     n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output := n16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_0ca8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_0ca8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1844_c2_6725_cond <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_cond;
     t16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue;
     t16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output := t16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_0ca8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_a26d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_a26d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_1781] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_return_output := result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;

     -- n16_MUX[uxn_opcodes_h_l1857_c7_0ca8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond;
     n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue;
     n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output := n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_1781_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_bc78] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output := result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;

     -- n16_MUX[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1844_c2_6725_cond <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_cond;
     n16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue;
     n16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output := n16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_bc78_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_0ca8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_0ca8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_6725] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_return_output := result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1882_l1840_DUPLICATE_ce41 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1882_l1840_DUPLICATE_ce41_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6725_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6725_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1882_l1840_DUPLICATE_ce41_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1882_l1840_DUPLICATE_ce41_return_output;
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
