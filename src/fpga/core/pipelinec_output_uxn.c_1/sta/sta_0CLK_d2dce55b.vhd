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
entity sta_0CLK_d2dce55b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_d2dce55b;
architecture arch of sta_0CLK_d2dce55b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2176_c6_3779]
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2176_c1_4a30]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c2_1e20]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2176_c2_1e20]
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c2_1e20]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c2_1e20]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2176_c2_1e20]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c2_1e20]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2176_c2_1e20]
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2176_c2_1e20]
signal n8_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2176_c2_1e20]
signal t16_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2177_c3_ff91[uxn_opcodes_h_l2177_c3_ff91]
signal printf_uxn_opcodes_h_l2177_c3_ff91_uxn_opcodes_h_l2177_c3_ff91_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_13e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_2a34]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2181_c7_2a34]
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_2a34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_2a34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2181_c7_2a34]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_2a34]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2181_c7_2a34]
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2181_c7_2a34]
signal n8_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2181_c7_2a34]
signal t16_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_9e4f]
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_2d0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2184_c7_2d0c]
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_2d0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2184_c7_2d0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2184_c7_2d0c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_2d0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2184_c7_2d0c]
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2184_c7_2d0c]
signal n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2184_c7_2d0c]
signal t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2186_c3_15ac]
signal CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_c176]
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_8cd3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2189_c7_8cd3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2189_c7_8cd3]
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2189_c7_8cd3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2189_c7_8cd3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2189_c7_8cd3]
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2189_c7_8cd3]
signal n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2189_c7_8cd3]
signal t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2190_c3_6d74]
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2192_c11_229b]
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2192_c7_11a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2192_c7_11a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2192_c7_11a7]
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2192_c7_11a7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2192_c7_11a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2192_c7_11a7]
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2192_c7_11a7]
signal n8_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2195_c30_1b36]
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_cdb5]
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_ea6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_ea6e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2200_c7_ea6e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_69e5( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_left,
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_right,
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output);

-- n8_MUX_uxn_opcodes_h_l2176_c2_1e20
n8_MUX_uxn_opcodes_h_l2176_c2_1e20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2176_c2_1e20_cond,
n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue,
n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse,
n8_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output);

-- t16_MUX_uxn_opcodes_h_l2176_c2_1e20
t16_MUX_uxn_opcodes_h_l2176_c2_1e20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2176_c2_1e20_cond,
t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue,
t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse,
t16_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output);

-- printf_uxn_opcodes_h_l2177_c3_ff91_uxn_opcodes_h_l2177_c3_ff91
printf_uxn_opcodes_h_l2177_c3_ff91_uxn_opcodes_h_l2177_c3_ff91 : entity work.printf_uxn_opcodes_h_l2177_c3_ff91_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2177_c3_ff91_uxn_opcodes_h_l2177_c3_ff91_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output);

-- n8_MUX_uxn_opcodes_h_l2181_c7_2a34
n8_MUX_uxn_opcodes_h_l2181_c7_2a34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2181_c7_2a34_cond,
n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue,
n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse,
n8_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output);

-- t16_MUX_uxn_opcodes_h_l2181_c7_2a34
t16_MUX_uxn_opcodes_h_l2181_c7_2a34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2181_c7_2a34_cond,
t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue,
t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse,
t16_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_left,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_right,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output);

-- n8_MUX_uxn_opcodes_h_l2184_c7_2d0c
n8_MUX_uxn_opcodes_h_l2184_c7_2d0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond,
n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue,
n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse,
n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output);

-- t16_MUX_uxn_opcodes_h_l2184_c7_2d0c
t16_MUX_uxn_opcodes_h_l2184_c7_2d0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond,
t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue,
t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse,
t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac
CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_x,
CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_left,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_right,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output);

-- n8_MUX_uxn_opcodes_h_l2189_c7_8cd3
n8_MUX_uxn_opcodes_h_l2189_c7_8cd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond,
n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue,
n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse,
n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output);

-- t16_MUX_uxn_opcodes_h_l2189_c7_8cd3
t16_MUX_uxn_opcodes_h_l2189_c7_8cd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond,
t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue,
t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse,
t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74
BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_left,
BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_right,
BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_left,
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_right,
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond,
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output);

-- n8_MUX_uxn_opcodes_h_l2192_c7_11a7
n8_MUX_uxn_opcodes_h_l2192_c7_11a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2192_c7_11a7_cond,
n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue,
n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse,
n8_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36
sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_ins,
sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_x,
sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_y,
sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_left,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_right,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
 n8_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
 t16_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output,
 n8_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output,
 t16_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output,
 n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output,
 t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output,
 CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output,
 n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output,
 t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output,
 n8_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output,
 sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_5151 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2177_c3_ff91_uxn_opcodes_h_l2177_c3_ff91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_1100 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_fc39 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2184_c7_2d0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_fe5e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_d158_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_8d26_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_dc7d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_7cc8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_ac6b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_8267_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l2206_l2171_DUPLICATE_7f94_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_5151 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_5151;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_1100 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_1100;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_fc39 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_fc39;
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_fe5e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_fe5e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_ac6b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_ac6b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2192_c11_229b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_d158 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_d158_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_7cc8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_7cc8_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2176_c6_3779] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_left;
     BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output := BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_8267 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_8267_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_c176] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_left;
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output := BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2184_c7_2d0c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2184_c7_2d0c_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l2195_c30_1b36] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_ins;
     sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_x;
     sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_return_output := sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_13e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_9e4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_dc7d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_dc7d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_cdb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_8d26 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_8d26_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_3779_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_13e1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_9e4f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_c176_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_229b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_cdb5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_8267_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_8267_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_dc7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_dc7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_dc7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_dc7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_dc7d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_d158_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_d158_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_d158_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_d158_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_d158_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_ac6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_ac6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_ac6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_ac6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_ac6b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_8d26_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_8d26_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_8d26_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_8d26_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_8d26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_fe5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_fe5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_fe5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_fe5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_fe5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_7cc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_7cc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_7cc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_7cc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_7cc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2184_c7_2d0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_1b36_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2192_c7_11a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2192_c7_11a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_ea6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output;

     -- n8_MUX[uxn_opcodes_h_l2192_c7_11a7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2192_c7_11a7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_cond;
     n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue;
     n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output := n8_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2184_c7_2d0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2186_c3_15ac] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_return_output := CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2176_c1_4a30] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_ea6e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2192_c7_11a7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output := result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2200_c7_ea6e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2190_c3_6d74] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_left;
     BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_return_output := BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_6d74_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_15ac_return_output;
     VAR_printf_uxn_opcodes_h_l2177_c3_ff91_uxn_opcodes_h_l2177_c3_ff91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_4a30_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_ea6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2192_c7_11a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2189_c7_8cd3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2192_c7_11a7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2189_c7_8cd3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond;
     n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue;
     n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output := n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2189_c7_8cd3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2189_c7_8cd3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond;
     t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue;
     t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output := t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2192_c7_11a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_2a34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2189_c7_8cd3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output := result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;

     -- printf_uxn_opcodes_h_l2177_c3_ff91[uxn_opcodes_h_l2177_c3_ff91] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2177_c3_ff91_uxn_opcodes_h_l2177_c3_ff91_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2177_c3_ff91_uxn_opcodes_h_l2177_c3_ff91_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_11a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2184_c7_2d0c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c2_1e20] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output;

     -- t16_MUX[uxn_opcodes_h_l2184_c7_2d0c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond;
     t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue;
     t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output := t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2189_c7_8cd3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2189_c7_8cd3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;

     -- n8_MUX[uxn_opcodes_h_l2184_c7_2d0c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond;
     n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue;
     n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output := n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2184_c7_2d0c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_2d0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_8cd3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_8cd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2181_c7_2a34] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output := result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_2d0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2181_c7_2a34] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output := result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_2d0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2184_c7_2d0c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2181_c7_2a34] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2181_c7_2a34_cond <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_cond;
     n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue;
     n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output := n8_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_2a34] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;

     -- t16_MUX[uxn_opcodes_h_l2181_c7_2a34] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2181_c7_2a34_cond <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_cond;
     t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue;
     t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output := t16_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_2d0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;
     -- t16_MUX[uxn_opcodes_h_l2176_c2_1e20] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2176_c2_1e20_cond <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_cond;
     t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue;
     t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output := t16_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_2a34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2176_c2_1e20] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output := result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output;

     -- n8_MUX[uxn_opcodes_h_l2176_c2_1e20] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2176_c2_1e20_cond <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_cond;
     n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue;
     n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output := n8_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2176_c2_1e20] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output := result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c2_1e20] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_2a34] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2181_c7_2a34] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2a34_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c2_1e20] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2176_c2_1e20] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c2_1e20] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l2206_l2171_DUPLICATE_7f94 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l2206_l2171_DUPLICATE_7f94_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_69e5(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_1e20_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l2206_l2171_DUPLICATE_7f94_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l2206_l2171_DUPLICATE_7f94_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
