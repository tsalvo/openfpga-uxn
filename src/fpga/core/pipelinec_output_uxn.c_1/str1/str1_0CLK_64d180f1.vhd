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
-- Submodules: 41
entity str1_0CLK_64d180f1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_64d180f1;
architecture arch of str1_0CLK_64d180f1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1656_c6_faf8]
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1656_c2_8ab0]
signal n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1656_c2_8ab0]
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1656_c2_8ab0]
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c2_8ab0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c2_8ab0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c2_8ab0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1656_c2_8ab0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1656_c2_8ab0]
signal t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_fe27]
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1663_c7_c871]
signal n8_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1663_c7_c871]
signal result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_c871]
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1663_c7_c871]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_c871]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_c871]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1663_c7_c871]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1663_c7_c871]
signal t8_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_38e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1666_c7_963a]
signal n8_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1666_c7_963a]
signal result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1666_c7_963a]
signal result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_963a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1666_c7_963a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_963a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1666_c7_963a]
signal t8_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_82d4]
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1669_c7_338c]
signal n8_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1669_c7_338c]
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_338c]
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_338c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1669_c7_338c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1669_c7_338c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1672_c30_9033]
signal sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1674_c22_a182]
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_6cd6]
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_8d4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1677_c7_8d4d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1677_c7_8d4d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_ram_write := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8
BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_left,
BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_right,
BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output);

-- n8_MUX_uxn_opcodes_h_l1656_c2_8ab0
n8_MUX_uxn_opcodes_h_l1656_c2_8ab0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond,
n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue,
n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse,
n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0
result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0
result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output);

-- t8_MUX_uxn_opcodes_h_l1656_c2_8ab0
t8_MUX_uxn_opcodes_h_l1656_c2_8ab0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond,
t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue,
t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse,
t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_left,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_right,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output);

-- n8_MUX_uxn_opcodes_h_l1663_c7_c871
n8_MUX_uxn_opcodes_h_l1663_c7_c871 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1663_c7_c871_cond,
n8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue,
n8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse,
n8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871
result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond,
result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871
result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_return_output);

-- t8_MUX_uxn_opcodes_h_l1663_c7_c871
t8_MUX_uxn_opcodes_h_l1663_c7_c871 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1663_c7_c871_cond,
t8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue,
t8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse,
t8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output);

-- n8_MUX_uxn_opcodes_h_l1666_c7_963a
n8_MUX_uxn_opcodes_h_l1666_c7_963a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1666_c7_963a_cond,
n8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue,
n8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse,
n8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a
result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a
result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_return_output);

-- t8_MUX_uxn_opcodes_h_l1666_c7_963a
t8_MUX_uxn_opcodes_h_l1666_c7_963a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1666_c7_963a_cond,
t8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue,
t8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse,
t8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_left,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_right,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output);

-- n8_MUX_uxn_opcodes_h_l1669_c7_338c
n8_MUX_uxn_opcodes_h_l1669_c7_338c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1669_c7_338c_cond,
n8_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue,
n8_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse,
n8_MUX_uxn_opcodes_h_l1669_c7_338c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c
result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1672_c30_9033
sp_relative_shift_uxn_opcodes_h_l1672_c30_9033 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_ins,
sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_x,
sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_y,
sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_left,
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_right,
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_left,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_right,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output,
 n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
 t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output,
 n8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_return_output,
 t8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output,
 n8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_return_output,
 t8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output,
 n8_MUX_uxn_opcodes_h_l1669_c7_338c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1660_c3_2667 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_ffd0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1663_c7_c871_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1674_c3_adc3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1674_c27_e4f7_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1678_c3_250a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_537d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_73df_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_c2e7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_94fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1669_DUPLICATE_1e88_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1683_l1652_DUPLICATE_0a05_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1660_c3_2667 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1660_c3_2667;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_ffd0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_ffd0;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1678_c3_250a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1678_c3_250a;
     VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1669_DUPLICATE_1e88 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1669_DUPLICATE_1e88_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_6cd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1672_c30_9033] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_ins;
     sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_x;
     sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_return_output := sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_94fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_94fe_return_output := result.is_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1663_c7_c871] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1663_c7_c871_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_c2e7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_c2e7_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1674_c27_e4f7] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1674_c27_e4f7_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_73df LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_73df_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1656_c6_faf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_82d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_537d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_537d_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_fe27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_left;
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output := BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_38e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_faf8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_fe27_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_38e8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_82d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_6cd6_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1674_c27_e4f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_c2e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_c2e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_c2e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_c2e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_537d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_537d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_537d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_537d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1669_DUPLICATE_1e88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1669_DUPLICATE_1e88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1669_DUPLICATE_1e88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1669_DUPLICATE_1e88_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_94fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_94fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_94fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1663_l1677_l1666_l1656_DUPLICATE_94fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_73df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_73df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_73df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1666_l1656_l1669_DUPLICATE_73df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1663_c7_c871_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_9033_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1677_c7_8d4d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_c871] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;

     -- n8_MUX[uxn_opcodes_h_l1669_c7_338c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1669_c7_338c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_cond;
     n8_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue;
     n8_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_return_output := n8_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_338c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_8d4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1666_c7_963a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1666_c7_963a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_cond;
     t8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue;
     t8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output := t8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1674_c22_a182] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1677_c7_8d4d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1674_c3_adc3 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_a182_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_8d4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1674_c3_adc3;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_338c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1666_c7_963a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1666_c7_963a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_cond;
     n8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue;
     n8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output := n8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1663_c7_c871] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1663_c7_c871_cond <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_cond;
     t8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue;
     t8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output := t8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1666_c7_963a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1669_c7_338c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1669_c7_338c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c2_8ab0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1669_c7_338c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_338c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1666_c7_963a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_c871] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output := result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;

     -- n8_MUX[uxn_opcodes_h_l1663_c7_c871] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1663_c7_c871_cond <= VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_cond;
     n8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue;
     n8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output := n8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;

     -- t8_MUX[uxn_opcodes_h_l1656_c2_8ab0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond;
     t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue;
     t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output := t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_963a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_963a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1666_c7_963a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_963a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output;
     -- n8_MUX[uxn_opcodes_h_l1656_c2_8ab0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond;
     n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue;
     n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output := n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1663_c7_c871] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_c871] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1656_c2_8ab0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1663_c7_c871] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output := result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1663_c7_c871] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1663_c7_c871_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1656_c2_8ab0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c2_8ab0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1656_c2_8ab0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c2_8ab0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1683_l1652_DUPLICATE_0a05 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1683_l1652_DUPLICATE_0a05_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_8ab0_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1683_l1652_DUPLICATE_0a05_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1683_l1652_DUPLICATE_0a05_return_output;
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
