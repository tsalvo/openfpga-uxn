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
-- Submodules: 40
entity stz_0CLK_bacf6a1d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_bacf6a1d;
architecture arch of stz_0CLK_bacf6a1d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1522_c6_ff0e]
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal t8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1522_c2_30e8]
signal n8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1535_c11_cf67]
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1535_c7_42e7]
signal result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1535_c7_42e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1535_c7_42e7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1535_c7_42e7]
signal result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1535_c7_42e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1535_c7_42e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1535_c7_42e7]
signal t8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1535_c7_42e7]
signal n8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1538_c11_2a4e]
signal BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1538_c7_858a]
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1538_c7_858a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1538_c7_858a]
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1538_c7_858a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1538_c7_858a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1538_c7_858a]
signal t8_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1538_c7_858a]
signal n8_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1541_c11_cc35]
signal BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1541_c7_e0e8]
signal result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1541_c7_e0e8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1541_c7_e0e8]
signal result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1541_c7_e0e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1541_c7_e0e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1541_c7_e0e8]
signal n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1543_c30_e370]
signal sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e
BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_left,
BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_right,
BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8
result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8
result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8
result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8
result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- t8_MUX_uxn_opcodes_h_l1522_c2_30e8
t8_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
t8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- n8_MUX_uxn_opcodes_h_l1522_c2_30e8
n8_MUX_uxn_opcodes_h_l1522_c2_30e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond,
n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue,
n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse,
n8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_left,
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_right,
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7
result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7
result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7
result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output);

-- t8_MUX_uxn_opcodes_h_l1535_c7_42e7
t8_MUX_uxn_opcodes_h_l1535_c7_42e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond,
t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue,
t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse,
t8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output);

-- n8_MUX_uxn_opcodes_h_l1535_c7_42e7
n8_MUX_uxn_opcodes_h_l1535_c7_42e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond,
n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue,
n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse,
n8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e
BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_left,
BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_right,
BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a
result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a
result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_return_output);

-- t8_MUX_uxn_opcodes_h_l1538_c7_858a
t8_MUX_uxn_opcodes_h_l1538_c7_858a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1538_c7_858a_cond,
t8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue,
t8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse,
t8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output);

-- n8_MUX_uxn_opcodes_h_l1538_c7_858a
n8_MUX_uxn_opcodes_h_l1538_c7_858a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1538_c7_858a_cond,
n8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue,
n8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse,
n8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35
BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_left,
BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_right,
BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8
result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8
result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8
result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8
result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output);

-- n8_MUX_uxn_opcodes_h_l1541_c7_e0e8
n8_MUX_uxn_opcodes_h_l1541_c7_e0e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond,
n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue,
n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse,
n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1543_c30_e370
sp_relative_shift_uxn_opcodes_h_l1543_c30_e370 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_ins,
sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_x,
sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_y,
sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 t8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 n8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output,
 t8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output,
 n8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_return_output,
 t8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output,
 n8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output,
 n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output,
 sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1532_c3_6554 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1527_c3_a460 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1536_c3_abdc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_c7_42e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1545_c22_b17a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_9c06_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_a16a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_c9bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_939b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_1087_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1518_l1550_DUPLICATE_0d06_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1527_c3_a460 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1527_c3_a460;
     VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1532_c3_6554 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1532_c3_6554;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1536_c3_abdc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1536_c3_abdc;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_c9bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_c9bf_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1543_c30_e370] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_ins;
     sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_x;
     sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_return_output := sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1541_c11_cc35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_left;
     BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output := BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1535_c11_cf67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_left;
     BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output := BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_9c06 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_9c06_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1545_c22_b17a] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1545_c22_b17a_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_1087 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_1087_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1522_c6_ff0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_939b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_939b_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1535_c7_42e7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_c7_42e7_return_output := result.stack_address_sp_offset;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_a16a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_a16a_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1538_c11_2a4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_ff0e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_cf67_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c11_2a4e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_cc35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1545_c22_b17a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_939b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_939b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_939b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_a16a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_a16a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_a16a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_a16a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_1087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_1087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_1087_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_c9bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_c9bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1541_l1535_l1538_DUPLICATE_c9bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_9c06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_9c06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_9c06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1541_l1535_l1538_l1522_DUPLICATE_9c06_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1522_c2_30e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_c7_42e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1543_c30_e370_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1541_c7_e0e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- n8_MUX[uxn_opcodes_h_l1541_c7_e0e8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond <= VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond;
     n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue;
     n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output := n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1541_c7_e0e8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1541_c7_e0e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1538_c7_858a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1538_c7_858a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_cond;
     t8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue;
     t8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output := t8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1541_c7_e0e8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1541_c7_e0e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1535_c7_42e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1541_c7_e0e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1538_c7_858a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1538_c7_858a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1535_c7_42e7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond;
     t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue;
     t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output := t8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1538_c7_858a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1538_c7_858a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1538_c7_858a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1538_c7_858a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1538_c7_858a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_cond;
     n8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_iftrue;
     n8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output := n8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c7_858a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1535_c7_42e7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1535_c7_42e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1535_c7_42e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1535_c7_42e7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;

     -- n8_MUX[uxn_opcodes_h_l1535_c7_42e7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond <= VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_cond;
     n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue;
     n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output := n8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := t8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1535_c7_42e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1535_c7_42e7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- n8_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := n8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1522_c2_30e8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1518_l1550_DUPLICATE_0d06 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1518_l1550_DUPLICATE_0d06_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_30e8_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1518_l1550_DUPLICATE_0d06_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1518_l1550_DUPLICATE_0d06_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
