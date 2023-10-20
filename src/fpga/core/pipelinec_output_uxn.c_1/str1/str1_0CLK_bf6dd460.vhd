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
-- Submodules: 55
entity str1_0CLK_bf6dd460 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_bf6dd460;
architecture arch of str1_0CLK_bf6dd460 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1777_c6_dca8]
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1777_c2_9615]
signal n8_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1777_c2_9615]
signal t8_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c2_9615]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1777_c2_9615]
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1777_c2_9615]
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c2_9615]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1777_c2_9615]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c2_9615]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1777_c2_9615]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_9356]
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1782_c7_f325]
signal n8_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1782_c7_f325]
signal t8_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1782_c7_f325]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1782_c7_f325]
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1782_c7_f325]
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_f325]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1782_c7_f325]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1782_c7_f325]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1782_c7_f325]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_353f]
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1785_c7_a39c]
signal n8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1785_c7_a39c]
signal t8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_a39c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_a39c]
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_a39c]
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_a39c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1785_c7_a39c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_a39c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1785_c7_a39c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_fd10]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1789_c7_bd28]
signal n8_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_bd28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_bd28]
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1789_c7_bd28]
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_bd28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1789_c7_bd28]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1789_c7_bd28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_bd28]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1792_c11_188b]
signal BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1792_c7_7320]
signal n8_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1792_c7_7320]
signal result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1792_c7_7320]
signal result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1792_c7_7320]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1792_c7_7320]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1792_c7_7320]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1792_c7_7320]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1795_c30_8c97]
signal sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1797_c22_afc0]
signal BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_9133]
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_c425]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1800_c7_c425]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1800_c7_c425]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_left,
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_right,
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output);

-- n8_MUX_uxn_opcodes_h_l1777_c2_9615
n8_MUX_uxn_opcodes_h_l1777_c2_9615 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1777_c2_9615_cond,
n8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue,
n8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse,
n8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output);

-- t8_MUX_uxn_opcodes_h_l1777_c2_9615
t8_MUX_uxn_opcodes_h_l1777_c2_9615 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1777_c2_9615_cond,
t8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue,
t8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse,
t8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond,
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond,
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_left,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_right,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output);

-- n8_MUX_uxn_opcodes_h_l1782_c7_f325
n8_MUX_uxn_opcodes_h_l1782_c7_f325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1782_c7_f325_cond,
n8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue,
n8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse,
n8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output);

-- t8_MUX_uxn_opcodes_h_l1782_c7_f325
t8_MUX_uxn_opcodes_h_l1782_c7_f325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1782_c7_f325_cond,
t8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue,
t8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse,
t8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond,
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond,
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_left,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_right,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output);

-- n8_MUX_uxn_opcodes_h_l1785_c7_a39c
n8_MUX_uxn_opcodes_h_l1785_c7_a39c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond,
n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue,
n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse,
n8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output);

-- t8_MUX_uxn_opcodes_h_l1785_c7_a39c
t8_MUX_uxn_opcodes_h_l1785_c7_a39c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond,
t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue,
t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse,
t8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c
result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c
result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output);

-- n8_MUX_uxn_opcodes_h_l1789_c7_bd28
n8_MUX_uxn_opcodes_h_l1789_c7_bd28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1789_c7_bd28_cond,
n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue,
n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse,
n8_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond,
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b
BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_left,
BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_right,
BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output);

-- n8_MUX_uxn_opcodes_h_l1792_c7_7320
n8_MUX_uxn_opcodes_h_l1792_c7_7320 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1792_c7_7320_cond,
n8_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue,
n8_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse,
n8_MUX_uxn_opcodes_h_l1792_c7_7320_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320
result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond,
result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320
result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond,
result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320
result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320
result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320
result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320
result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97
sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_ins,
sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_x,
sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_y,
sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0
BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_left,
BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_right,
BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_left,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_right,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425
result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425
result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output,
 n8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
 t8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output,
 n8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output,
 t8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output,
 n8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output,
 t8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output,
 n8_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output,
 n8_MUX_uxn_opcodes_h_l1792_c7_7320_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output,
 sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1779_c3_3062 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1783_c3_cb70 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_15bb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1790_c3_e30a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1789_c7_bd28_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1797_c3_37e8 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1797_c27_d26f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_2b23_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_95c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_4558_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_30a4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_54d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1782_l1800_l1792_l1789_l1785_DUPLICATE_bafa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1807_l1773_DUPLICATE_257a_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1790_c3_e30a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1790_c3_e30a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_15bb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_15bb;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1783_c3_cb70 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1783_c3_cb70;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1779_c3_3062 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1779_c3_3062;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1792_c11_188b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1782_l1800_l1792_l1789_l1785_DUPLICATE_bafa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1782_l1800_l1792_l1789_l1785_DUPLICATE_bafa_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_4558 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_4558_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_9133] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_left;
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_return_output := BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_2b23 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_2b23_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_30a4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_30a4_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1797_c27_d26f] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1797_c27_d26f_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1789_c7_bd28] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1789_c7_bd28_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_95c2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_95c2_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1777_c6_dca8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_54d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_54d1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_353f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_fd10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_9356] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_left;
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output := BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1795_c30_8c97] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_ins;
     sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_x;
     sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_return_output := sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_dca8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_9356_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_353f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fd10_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1792_c11_188b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_9133_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1797_c27_d26f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_30a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_30a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_30a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_30a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_30a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_95c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_95c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_95c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_95c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_95c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1782_l1800_l1792_l1789_l1785_DUPLICATE_bafa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1782_l1800_l1792_l1789_l1785_DUPLICATE_bafa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1782_l1800_l1792_l1789_l1785_DUPLICATE_bafa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1782_l1800_l1792_l1789_l1785_DUPLICATE_bafa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1782_l1800_l1792_l1789_l1785_DUPLICATE_bafa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_4558_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_4558_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_4558_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_4558_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_4558_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_54d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_54d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_54d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_54d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1782_l1777_l1800_l1789_l1785_DUPLICATE_54d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_2b23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_2b23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_2b23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_2b23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1782_l1777_l1792_l1789_l1785_DUPLICATE_2b23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1789_c7_bd28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1795_c30_8c97_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1792_c7_7320] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output := result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1797_c22_afc0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_return_output;

     -- t8_MUX[uxn_opcodes_h_l1785_c7_a39c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond;
     t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue;
     t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output := t8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1792_c7_7320] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;

     -- n8_MUX[uxn_opcodes_h_l1792_c7_7320] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1792_c7_7320_cond <= VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_cond;
     n8_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue;
     n8_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_return_output := n8_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_bd28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1800_c7_c425] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1800_c7_c425] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_c425] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1797_c3_37e8 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1797_c22_afc0_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_c425_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1800_c7_c425_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_c425_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1797_c3_37e8;
     -- n8_MUX[uxn_opcodes_h_l1789_c7_bd28] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1789_c7_bd28_cond <= VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_cond;
     n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue;
     n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output := n8_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1792_c7_7320] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_bd28] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output := result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1792_c7_7320] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1789_c7_bd28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1792_c7_7320] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_a39c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1792_c7_7320] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output := result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;

     -- t8_MUX[uxn_opcodes_h_l1782_c7_f325] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1782_c7_f325_cond <= VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_cond;
     t8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue;
     t8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output := t8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1792_c7_7320_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_bd28] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;

     -- t8_MUX[uxn_opcodes_h_l1777_c2_9615] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1777_c2_9615_cond <= VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_cond;
     t8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue;
     t8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output := t8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output;

     -- n8_MUX[uxn_opcodes_h_l1785_c7_a39c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_cond;
     n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue;
     n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output := n8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_a39c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1789_c7_bd28] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output := result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_bd28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1782_c7_f325] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_a39c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1789_c7_bd28] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_bd28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1782_c7_f325] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_a39c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1782_c7_f325] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1782_c7_f325_cond <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_cond;
     n8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue;
     n8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output := n8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_a39c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1782_c7_f325] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output := result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1785_c7_a39c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1785_c7_a39c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c2_9615] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_a39c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_f325] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1782_c7_f325] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;

     -- n8_MUX[uxn_opcodes_h_l1777_c2_9615] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1777_c2_9615_cond <= VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_cond;
     n8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue;
     n8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output := n8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c2_9615] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1782_c7_f325] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1782_c7_f325] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output := result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1777_c2_9615] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output := result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1777_c2_9615_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_f325_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1777_c2_9615] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c2_9615] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1777_c2_9615] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output := result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1777_c2_9615] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1807_l1773_DUPLICATE_257a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1807_l1773_DUPLICATE_257a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c2_9615_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1807_l1773_DUPLICATE_257a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1807_l1773_DUPLICATE_257a_return_output;
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
