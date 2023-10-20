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
-- Submodules: 54
entity stz_0CLK_22fc9fcf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_22fc9fcf;
architecture arch of stz_0CLK_22fc9fcf is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1606_c6_eb12]
signal BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1606_c2_431a]
signal n8_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1606_c2_431a]
signal t8_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1606_c2_431a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1606_c2_431a]
signal result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1606_c2_431a]
signal result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1606_c2_431a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1606_c2_431a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1606_c2_431a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1606_c2_431a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1611_c11_65d4]
signal BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1611_c7_1e67]
signal n8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1611_c7_1e67]
signal t8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1611_c7_1e67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1611_c7_1e67]
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1611_c7_1e67]
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1611_c7_1e67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1611_c7_1e67]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1611_c7_1e67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1611_c7_1e67]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1614_c11_1b4b]
signal BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1614_c7_daf3]
signal n8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1614_c7_daf3]
signal t8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1614_c7_daf3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1614_c7_daf3]
signal result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1614_c7_daf3]
signal result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1614_c7_daf3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1614_c7_daf3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1614_c7_daf3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1614_c7_daf3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_4907]
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1618_c7_f0ef]
signal n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1618_c7_f0ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1618_c7_f0ef]
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1618_c7_f0ef]
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_f0ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1618_c7_f0ef]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1618_c7_f0ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_f0ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1621_c11_a06d]
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1621_c7_5418]
signal n8_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1621_c7_5418]
signal result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1621_c7_5418]
signal result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1621_c7_5418]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1621_c7_5418]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1621_c7_5418]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1621_c7_5418]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1624_c30_8069]
signal sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1629_c11_8a6f]
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1629_c7_8db0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1629_c7_8db0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1629_c7_8db0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12
BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_left,
BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_right,
BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output);

-- n8_MUX_uxn_opcodes_h_l1606_c2_431a
n8_MUX_uxn_opcodes_h_l1606_c2_431a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1606_c2_431a_cond,
n8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue,
n8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse,
n8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output);

-- t8_MUX_uxn_opcodes_h_l1606_c2_431a
t8_MUX_uxn_opcodes_h_l1606_c2_431a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1606_c2_431a_cond,
t8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue,
t8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse,
t8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a
result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a
result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a
result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a
result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a
result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_left,
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_right,
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output);

-- n8_MUX_uxn_opcodes_h_l1611_c7_1e67
n8_MUX_uxn_opcodes_h_l1611_c7_1e67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond,
n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue,
n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse,
n8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output);

-- t8_MUX_uxn_opcodes_h_l1611_c7_1e67
t8_MUX_uxn_opcodes_h_l1611_c7_1e67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond,
t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue,
t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse,
t8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond,
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond,
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b
BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_left,
BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_right,
BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output);

-- n8_MUX_uxn_opcodes_h_l1614_c7_daf3
n8_MUX_uxn_opcodes_h_l1614_c7_daf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond,
n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue,
n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse,
n8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output);

-- t8_MUX_uxn_opcodes_h_l1614_c7_daf3
t8_MUX_uxn_opcodes_h_l1614_c7_daf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond,
t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue,
t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse,
t8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3
result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3
result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3
result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3
result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3
result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_left,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_right,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output);

-- n8_MUX_uxn_opcodes_h_l1618_c7_f0ef
n8_MUX_uxn_opcodes_h_l1618_c7_f0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond,
n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue,
n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse,
n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_left,
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_right,
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output);

-- n8_MUX_uxn_opcodes_h_l1621_c7_5418
n8_MUX_uxn_opcodes_h_l1621_c7_5418 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1621_c7_5418_cond,
n8_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue,
n8_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse,
n8_MUX_uxn_opcodes_h_l1621_c7_5418_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418
result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond,
result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418
result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond,
result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418
result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1624_c30_8069
sp_relative_shift_uxn_opcodes_h_l1624_c30_8069 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_ins,
sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_x,
sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_y,
sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_left,
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_right,
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output,
 n8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
 t8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output,
 n8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output,
 t8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output,
 n8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output,
 t8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output,
 n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output,
 n8_MUX_uxn_opcodes_h_l1621_c7_5418_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output,
 sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1608_c3_e456 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1612_c3_12b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1616_c3_80b8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_390f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1618_c7_f0ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1626_c22_6bd7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_fb81_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_d4b4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_9136_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_986a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_7231_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1629_DUPLICATE_8eb4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1602_l1635_DUPLICATE_a1d7_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_390f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_390f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1612_c3_12b0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1612_c3_12b0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1616_c3_80b8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1616_c3_80b8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1608_c3_e456 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1608_c3_e456;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1618_c7_f0ef] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1618_c7_f0ef_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1626_c22_6bd7] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1626_c22_6bd7_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1611_c11_65d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_fb81 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_fb81_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1624_c30_8069] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_ins;
     sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_x;
     sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_return_output := sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_4907] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_left;
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output := BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_7231 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_7231_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1621_c11_a06d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_d4b4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_d4b4_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1614_c11_1b4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1606_c6_eb12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_left;
     BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output := BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1629_DUPLICATE_8eb4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1629_DUPLICATE_8eb4_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_9136 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_9136_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1629_c11_8a6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_986a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_986a_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c6_eb12_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_65d4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1614_c11_1b4b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_4907_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_a06d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_8a6f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1626_c22_6bd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_986a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_986a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_986a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_986a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_986a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_d4b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_d4b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_d4b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_d4b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_d4b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1629_DUPLICATE_8eb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1629_DUPLICATE_8eb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1629_DUPLICATE_8eb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1629_DUPLICATE_8eb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1629_DUPLICATE_8eb4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_9136_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_9136_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_9136_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_9136_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_9136_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_7231_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_7231_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_7231_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_7231_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1618_l1614_l1611_l1606_l1629_DUPLICATE_7231_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_fb81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_fb81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_fb81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_fb81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1621_l1618_l1614_l1611_l1606_DUPLICATE_fb81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1618_c7_f0ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1624_c30_8069_return_output;
     -- n8_MUX[uxn_opcodes_h_l1621_c7_5418] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1621_c7_5418_cond <= VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_cond;
     n8_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue;
     n8_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_return_output := n8_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1621_c7_5418] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output := result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1621_c7_5418] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1621_c7_5418] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output := result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1629_c7_8db0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1629_c7_8db0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output;

     -- t8_MUX[uxn_opcodes_h_l1614_c7_daf3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond;
     t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue;
     t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output := t8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1618_c7_f0ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1629_c7_8db0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_8db0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;
     -- n8_MUX[uxn_opcodes_h_l1618_c7_f0ef] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond <= VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond;
     n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue;
     n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output := n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1621_c7_5418] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;

     -- t8_MUX[uxn_opcodes_h_l1611_c7_1e67] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond <= VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond;
     t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue;
     t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output := t8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1621_c7_5418] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1614_c7_daf3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1618_c7_f0ef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output := result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1618_c7_f0ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1618_c7_f0ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1621_c7_5418] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_5418_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1611_c7_1e67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;

     -- n8_MUX[uxn_opcodes_h_l1614_c7_daf3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_cond;
     n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue;
     n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output := n8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1614_c7_daf3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1618_c7_f0ef] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;

     -- t8_MUX[uxn_opcodes_h_l1606_c2_431a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1606_c2_431a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_cond;
     t8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue;
     t8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output := t8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_f0ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1614_c7_daf3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_f0ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1614_c7_daf3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f0ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output;
     -- n8_MUX[uxn_opcodes_h_l1611_c7_1e67] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond <= VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_cond;
     n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue;
     n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output := n8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1606_c2_431a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1611_c7_1e67] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output := result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1614_c7_daf3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1611_c7_1e67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output := result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1611_c7_1e67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1614_c7_daf3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1614_c7_daf3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1614_c7_daf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1611_c7_1e67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1611_c7_1e67] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1606_c2_431a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1606_c2_431a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1606_c2_431a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1606_c2_431a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_cond;
     n8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue;
     n8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output := n8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1606_c2_431a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1611_c7_1e67] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1606_c2_431a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_1e67_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1606_c2_431a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1606_c2_431a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1606_c2_431a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1602_l1635_DUPLICATE_a1d7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1602_l1635_DUPLICATE_a1d7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c2_431a_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1602_l1635_DUPLICATE_a1d7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l1602_l1635_DUPLICATE_a1d7_return_output;
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
