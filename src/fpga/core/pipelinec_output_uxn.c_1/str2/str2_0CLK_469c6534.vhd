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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 85
entity str2_0CLK_469c6534 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_469c6534;
architecture arch of str2_0CLK_469c6534 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1815_c6_b50d]
signal BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1815_c2_0ab0]
signal n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1815_c2_0ab0]
signal t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1815_c2_0ab0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1815_c2_0ab0]
signal result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1815_c2_0ab0]
signal result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1815_c2_0ab0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1815_c2_0ab0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1815_c2_0ab0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1815_c2_0ab0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1820_c11_bbf6]
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1820_c7_c34d]
signal n16_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1820_c7_c34d]
signal t8_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1820_c7_c34d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1820_c7_c34d]
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1820_c7_c34d]
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1820_c7_c34d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1820_c7_c34d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1820_c7_c34d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1820_c7_c34d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1823_c11_df1d]
signal BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1823_c7_bf7e]
signal n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1823_c7_bf7e]
signal t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1823_c7_bf7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1823_c7_bf7e]
signal result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1823_c7_bf7e]
signal result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1823_c7_bf7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1823_c7_bf7e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1823_c7_bf7e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1823_c7_bf7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1827_c11_0148]
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1827_c7_6f5c]
signal n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1827_c7_6f5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1827_c7_6f5c]
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1827_c7_6f5c]
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1827_c7_6f5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1827_c7_6f5c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1827_c7_6f5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1827_c7_6f5c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1830_c11_7b2d]
signal BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1830_c7_9f94]
signal n16_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1830_c7_9f94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1830_c7_9f94]
signal result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1830_c7_9f94]
signal result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1830_c7_9f94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1830_c7_9f94]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1830_c7_9f94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1830_c7_9f94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1832_c3_1dd8]
signal CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_9454]
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1835_c7_004f]
signal n16_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1835_c7_004f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1835_c7_004f]
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1835_c7_004f]
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_004f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1835_c7_004f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1835_c7_004f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_004f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1838_c11_590b]
signal BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1838_c7_63c5]
signal n16_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1838_c7_63c5]
signal result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1838_c7_63c5]
signal result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1838_c7_63c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1838_c7_63c5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1838_c7_63c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1838_c7_63c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1839_c3_4d0e]
signal BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1841_c30_13df]
signal sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1844_c31_1ba9]
signal CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1846_c11_89cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1846_c7_2f7d]
signal result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1846_c7_2f7d]
signal result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1846_c7_2f7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1846_c7_2f7d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1846_c7_2f7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1848_c22_77fa]
signal BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1851_c11_e377]
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1851_c7_b4be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1851_c7_b4be]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_return_output : signed(17 downto 0);

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

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_sp_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d
BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_left,
BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_right,
BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output);

-- n16_MUX_uxn_opcodes_h_l1815_c2_0ab0
n16_MUX_uxn_opcodes_h_l1815_c2_0ab0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond,
n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue,
n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse,
n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output);

-- t8_MUX_uxn_opcodes_h_l1815_c2_0ab0
t8_MUX_uxn_opcodes_h_l1815_c2_0ab0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond,
t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue,
t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse,
t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0
result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0
result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0
result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_left,
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_right,
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output);

-- n16_MUX_uxn_opcodes_h_l1820_c7_c34d
n16_MUX_uxn_opcodes_h_l1820_c7_c34d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1820_c7_c34d_cond,
n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue,
n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse,
n16_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output);

-- t8_MUX_uxn_opcodes_h_l1820_c7_c34d
t8_MUX_uxn_opcodes_h_l1820_c7_c34d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1820_c7_c34d_cond,
t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue,
t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse,
t8_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d
BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_left,
BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_right,
BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output);

-- n16_MUX_uxn_opcodes_h_l1823_c7_bf7e
n16_MUX_uxn_opcodes_h_l1823_c7_bf7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond,
n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue,
n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse,
n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output);

-- t8_MUX_uxn_opcodes_h_l1823_c7_bf7e
t8_MUX_uxn_opcodes_h_l1823_c7_bf7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond,
t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue,
t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse,
t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e
result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e
result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e
result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e
result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e
result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_left,
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_right,
BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output);

-- n16_MUX_uxn_opcodes_h_l1827_c7_6f5c
n16_MUX_uxn_opcodes_h_l1827_c7_6f5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond,
n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue,
n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse,
n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_left,
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_right,
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output);

-- n16_MUX_uxn_opcodes_h_l1830_c7_9f94
n16_MUX_uxn_opcodes_h_l1830_c7_9f94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1830_c7_9f94_cond,
n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue,
n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse,
n16_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94
result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond,
result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94
result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond,
result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94
result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8
CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_x,
CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_left,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_right,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output);

-- n16_MUX_uxn_opcodes_h_l1835_c7_004f
n16_MUX_uxn_opcodes_h_l1835_c7_004f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1835_c7_004f_cond,
n16_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue,
n16_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse,
n16_MUX_uxn_opcodes_h_l1835_c7_004f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_left,
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_right,
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output);

-- n16_MUX_uxn_opcodes_h_l1838_c7_63c5
n16_MUX_uxn_opcodes_h_l1838_c7_63c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1838_c7_63c5_cond,
n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue,
n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse,
n16_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5
result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5
result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5
result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5
result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5
result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e
BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_left,
BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_right,
BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1841_c30_13df
sp_relative_shift_uxn_opcodes_h_l1841_c30_13df : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_ins,
sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_x,
sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_y,
sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9
CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_x,
CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d
result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d
result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d
result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d
result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d
result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa
BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_left,
BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_right,
BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_left,
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_right,
BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_return_output);



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
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output,
 n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
 t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output,
 n16_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output,
 t8_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output,
 n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output,
 t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output,
 n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output,
 n16_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output,
 CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output,
 n16_MUX_uxn_opcodes_h_l1835_c7_004f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output,
 n16_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_return_output,
 sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_return_output,
 CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1817_c3_cff1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_494c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_4eba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1828_c3_82f7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_be2f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1836_c3_b0fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1835_c7_004f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1843_c3_50e7 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1844_c21_a66f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1848_c3_914d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1849_c21_1388_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_7cd1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_cc98_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1815_DUPLICATE_3696_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1815_l1838_DUPLICATE_ff93_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_3f85_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1838_DUPLICATE_4bfd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1831_l1839_DUPLICATE_70c9_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_addb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1856_l1810_DUPLICATE_15ab_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_be2f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_be2f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1828_c3_82f7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1828_c3_82f7;
     VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1836_c3_b0fe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1836_c3_b0fe;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_494c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_494c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1817_c3_cff1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1817_c3_cff1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_4eba := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1825_c3_4eba;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1830_c11_7b2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_3f85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_3f85_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1820_c11_bbf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1838_DUPLICATE_4bfd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1838_DUPLICATE_4bfd_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1841_c30_13df] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_ins;
     sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_x;
     sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_return_output := sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1823_c11_df1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1851_c11_e377] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_left;
     BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_return_output := BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1838_c11_590b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_cc98 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_cc98_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1835_c7_004f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1835_c7_004f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_7cd1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_7cd1_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_9454] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_left;
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output := BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1846_c11_89cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1827_c11_0148] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_left;
     BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output := BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1815_c6_b50d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1815_DUPLICATE_3696 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1815_DUPLICATE_3696_return_output := result.is_ram_write;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_addb LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_addb_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1831_l1839_DUPLICATE_70c9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1831_l1839_DUPLICATE_70c9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1849_c21_1388] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1849_c21_1388_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1815_l1838_DUPLICATE_ff93 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1815_l1838_DUPLICATE_ff93_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c6_b50d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_bbf6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_df1d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1827_c11_0148_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_7b2d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_9454_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_590b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1846_c11_89cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c11_e377_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_addb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1831_l1839_DUPLICATE_70c9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1831_l1839_DUPLICATE_70c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1849_c21_1388_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1815_l1838_DUPLICATE_ff93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1815_l1838_DUPLICATE_ff93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1815_l1838_DUPLICATE_ff93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1815_l1838_DUPLICATE_ff93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1815_l1838_DUPLICATE_ff93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1815_l1838_DUPLICATE_ff93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1815_l1838_DUPLICATE_ff93_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_cc98_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_cc98_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_cc98_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_cc98_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_cc98_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_cc98_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_cc98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1838_DUPLICATE_4bfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1838_DUPLICATE_4bfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1838_DUPLICATE_4bfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1838_DUPLICATE_4bfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1838_DUPLICATE_4bfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1838_DUPLICATE_4bfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1838_DUPLICATE_4bfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1838_DUPLICATE_4bfd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1815_DUPLICATE_3696_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1815_DUPLICATE_3696_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1815_DUPLICATE_3696_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1815_DUPLICATE_3696_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1815_DUPLICATE_3696_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1815_DUPLICATE_3696_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1815_DUPLICATE_3696_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1851_l1820_l1846_l1815_DUPLICATE_3696_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_3f85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_3f85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_3f85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_3f85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_3f85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_3f85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_3f85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_7cd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_7cd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_7cd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_7cd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_7cd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_7cd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1835_l1830_l1827_l1823_l1820_l1846_l1815_DUPLICATE_7cd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1835_c7_004f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1841_c30_13df_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1839_c3_4d0e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_left;
     BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_return_output := BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1846_c7_2f7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1832_c3_1dd8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_return_output := CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1835_c7_004f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1846_c7_2f7d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1838_c7_63c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1851_c7_b4be] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1851_c7_b4be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output;

     -- t8_MUX[uxn_opcodes_h_l1823_c7_bf7e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond;
     t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue;
     t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output := t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1839_c3_4d0e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1843_c3_50e7 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1843_l1848_DUPLICATE_8815_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1832_c3_1dd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c7_b4be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1843_c3_50e7;
     -- n16_MUX[uxn_opcodes_h_l1838_c7_63c5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1838_c7_63c5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_cond;
     n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue;
     n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output := n16_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1830_c7_9f94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1846_c7_2f7d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1820_c7_c34d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1820_c7_c34d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_cond;
     t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue;
     t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output := t8_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1848_c22_77fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1835_c7_004f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1838_c7_63c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1846_c7_2f7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1844_c31_1ba9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_return_output := CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1848_c3_914d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1848_c22_77fa_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1848_c3_914d;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1830_c7_9f94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1846_c7_2f7d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1838_c7_63c5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1844_c21_a66f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1844_c21_a66f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1844_c31_1ba9_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1827_c7_6f5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_004f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1835_c7_004f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1835_c7_004f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_cond;
     n16_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue;
     n16_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_return_output := n16_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1815_c2_0ab0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond;
     t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue;
     t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output := t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1838_c7_63c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1844_c21_a66f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1846_c7_2f7d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1835_c7_004f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1823_c7_bf7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1827_c7_6f5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1838_c7_63c5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1838_c7_63c5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_004f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1830_c7_9f94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;

     -- n16_MUX[uxn_opcodes_h_l1830_c7_9f94] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1830_c7_9f94_cond <= VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_cond;
     n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue;
     n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output := n16_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1838_c7_63c5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1830_c7_9f94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1820_c7_c34d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1827_c7_6f5c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond;
     n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue;
     n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output := n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1830_c7_9f94] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1823_c7_bf7e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1835_c7_004f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1827_c7_6f5c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1835_c7_004f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1835_c7_004f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1830_c7_9f94] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output := result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1827_c7_6f5c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1820_c7_c34d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1815_c2_0ab0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1827_c7_6f5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1830_c7_9f94] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output := result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;

     -- n16_MUX[uxn_opcodes_h_l1823_c7_bf7e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond;
     n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue;
     n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output := n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1823_c7_bf7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1830_c7_9f94_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1820_c7_c34d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1827_c7_6f5c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1823_c7_bf7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1815_c2_0ab0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1823_c7_bf7e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1827_c7_6f5c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1820_c7_c34d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1820_c7_c34d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_cond;
     n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue;
     n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output := n16_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1827_c7_6f5c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1820_c7_c34d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1820_c7_c34d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1823_c7_bf7e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1823_c7_bf7e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1815_c2_0ab0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond;
     n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue;
     n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output := n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1815_c2_0ab0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1823_c7_bf7e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1820_c7_c34d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1820_c7_c34d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1815_c2_0ab0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1815_c2_0ab0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1820_c7_c34d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1815_c2_0ab0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1815_c2_0ab0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1856_l1810_DUPLICATE_15ab LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1856_l1810_DUPLICATE_15ab_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c2_0ab0_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1856_l1810_DUPLICATE_15ab_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1856_l1810_DUPLICATE_15ab_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
