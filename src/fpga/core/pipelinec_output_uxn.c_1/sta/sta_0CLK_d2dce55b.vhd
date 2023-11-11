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
-- BIN_OP_EQ[uxn_opcodes_h_l2176_c6_0e77]
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2176_c1_30a8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2176_c2_3603]
signal n8_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c2_3603]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c2_3603]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2176_c2_3603]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2176_c2_3603]
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c2_3603]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c2_3603]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2176_c2_3603]
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2176_c2_3603]
signal t16_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2177_c3_0868[uxn_opcodes_h_l2177_c3_0868]
signal printf_uxn_opcodes_h_l2177_c3_0868_uxn_opcodes_h_l2177_c3_0868_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_340f]
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2181_c7_2104]
signal n8_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_2104]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_2104]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2181_c7_2104]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2181_c7_2104]
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_2104]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_2104]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2181_c7_2104]
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2181_c7_2104]
signal t16_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_80a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2184_c7_66f9]
signal n8_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2184_c7_66f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_66f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2184_c7_66f9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2184_c7_66f9]
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_66f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_66f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2184_c7_66f9]
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2184_c7_66f9]
signal t16_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2186_c3_6c5c]
signal CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_990c]
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2189_c7_6781]
signal n8_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2189_c7_6781]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2189_c7_6781]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2189_c7_6781]
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2189_c7_6781]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_6781]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2189_c7_6781]
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2189_c7_6781]
signal t16_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2190_c3_b972]
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2192_c11_deca]
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2192_c7_002a]
signal n8_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2192_c7_002a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2192_c7_002a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2192_c7_002a]
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2192_c7_002a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2192_c7_002a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2192_c7_002a]
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2195_c30_f881]
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_baa4]
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_4c47]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_4c47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2200_c7_4c47]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ed17( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_left,
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_right,
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_return_output);

-- n8_MUX_uxn_opcodes_h_l2176_c2_3603
n8_MUX_uxn_opcodes_h_l2176_c2_3603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2176_c2_3603_cond,
n8_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue,
n8_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse,
n8_MUX_uxn_opcodes_h_l2176_c2_3603_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output);

-- t16_MUX_uxn_opcodes_h_l2176_c2_3603
t16_MUX_uxn_opcodes_h_l2176_c2_3603 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2176_c2_3603_cond,
t16_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue,
t16_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse,
t16_MUX_uxn_opcodes_h_l2176_c2_3603_return_output);

-- printf_uxn_opcodes_h_l2177_c3_0868_uxn_opcodes_h_l2177_c3_0868
printf_uxn_opcodes_h_l2177_c3_0868_uxn_opcodes_h_l2177_c3_0868 : entity work.printf_uxn_opcodes_h_l2177_c3_0868_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2177_c3_0868_uxn_opcodes_h_l2177_c3_0868_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_left,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_right,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output);

-- n8_MUX_uxn_opcodes_h_l2181_c7_2104
n8_MUX_uxn_opcodes_h_l2181_c7_2104 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2181_c7_2104_cond,
n8_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue,
n8_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse,
n8_MUX_uxn_opcodes_h_l2181_c7_2104_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output);

-- t16_MUX_uxn_opcodes_h_l2181_c7_2104
t16_MUX_uxn_opcodes_h_l2181_c7_2104 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2181_c7_2104_cond,
t16_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue,
t16_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse,
t16_MUX_uxn_opcodes_h_l2181_c7_2104_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output);

-- n8_MUX_uxn_opcodes_h_l2184_c7_66f9
n8_MUX_uxn_opcodes_h_l2184_c7_66f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2184_c7_66f9_cond,
n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue,
n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse,
n8_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output);

-- t16_MUX_uxn_opcodes_h_l2184_c7_66f9
t16_MUX_uxn_opcodes_h_l2184_c7_66f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2184_c7_66f9_cond,
t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue,
t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse,
t16_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c
CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_x,
CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_left,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_right,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output);

-- n8_MUX_uxn_opcodes_h_l2189_c7_6781
n8_MUX_uxn_opcodes_h_l2189_c7_6781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2189_c7_6781_cond,
n8_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue,
n8_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse,
n8_MUX_uxn_opcodes_h_l2189_c7_6781_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output);

-- t16_MUX_uxn_opcodes_h_l2189_c7_6781
t16_MUX_uxn_opcodes_h_l2189_c7_6781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2189_c7_6781_cond,
t16_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue,
t16_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse,
t16_MUX_uxn_opcodes_h_l2189_c7_6781_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972
BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_left,
BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_right,
BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_left,
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_right,
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output);

-- n8_MUX_uxn_opcodes_h_l2192_c7_002a
n8_MUX_uxn_opcodes_h_l2192_c7_002a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2192_c7_002a_cond,
n8_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue,
n8_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse,
n8_MUX_uxn_opcodes_h_l2192_c7_002a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond,
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2195_c30_f881
sp_relative_shift_uxn_opcodes_h_l2195_c30_f881 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_ins,
sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_x,
sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_y,
sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_left,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_right,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_return_output,
 n8_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
 t16_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output,
 n8_MUX_uxn_opcodes_h_l2181_c7_2104_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output,
 t16_MUX_uxn_opcodes_h_l2181_c7_2104_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output,
 n8_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output,
 t16_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output,
 CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output,
 n8_MUX_uxn_opcodes_h_l2189_c7_6781_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output,
 t16_MUX_uxn_opcodes_h_l2189_c7_6781_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output,
 n8_MUX_uxn_opcodes_h_l2192_c7_002a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_63d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2177_c3_0868_uxn_opcodes_h_l2177_c3_0868_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_265c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_5b0d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2184_c7_66f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_598a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_5768_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_e02d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_f2ac_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_7e15_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2181_l2200_l2192_l2189_DUPLICATE_34de_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_4b8c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l2171_l2206_DUPLICATE_a1b5_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_5b0d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_5b0d;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_265c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_265c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_63d4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_63d4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse := t16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2184_c7_66f9] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2184_c7_66f9_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_f2ac LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_f2ac_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2195_c30_f881] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_ins;
     sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_x;
     sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_return_output := sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_5768 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_5768_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2176_c6_0e77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_left;
     BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output := BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_80a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_baa4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_7e15 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_7e15_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2181_l2200_l2192_l2189_DUPLICATE_34de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2181_l2200_l2192_l2189_DUPLICATE_34de_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2192_c11_deca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_e02d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_e02d_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_598a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_598a_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_4b8c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_4b8c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_990c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_340f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_0e77_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_340f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_80a2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_990c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_deca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_baa4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_4b8c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_4b8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_f2ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_f2ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_f2ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_f2ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_f2ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_e02d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_e02d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_e02d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_e02d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_e02d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2181_l2200_l2192_l2189_DUPLICATE_34de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2181_l2200_l2192_l2189_DUPLICATE_34de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2181_l2200_l2192_l2189_DUPLICATE_34de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2181_l2200_l2192_l2189_DUPLICATE_34de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2181_l2200_l2192_l2189_DUPLICATE_34de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_5768_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_5768_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_5768_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_5768_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_5768_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_598a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_598a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_598a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_598a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2200_l2189_DUPLICATE_598a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_7e15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_7e15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_7e15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_7e15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2192_l2189_DUPLICATE_7e15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2184_c7_66f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_f881_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2192_c7_002a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output := result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2176_c1_30a8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2190_c3_b972] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_left;
     BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_return_output := BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2192_c7_002a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_4c47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_4c47] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output;

     -- n8_MUX[uxn_opcodes_h_l2192_c7_002a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2192_c7_002a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_cond;
     n8_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue;
     n8_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_return_output := n8_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2186_c3_6c5c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_return_output := CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2184_c7_66f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2192_c7_002a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2200_c7_4c47] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_b972_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_6c5c_return_output;
     VAR_printf_uxn_opcodes_h_l2177_c3_0868_uxn_opcodes_h_l2177_c3_0868_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_30a8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_4c47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2192_c7_002a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;

     -- n8_MUX[uxn_opcodes_h_l2189_c7_6781] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2189_c7_6781_cond <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_cond;
     n8_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue;
     n8_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_return_output := n8_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2189_c7_6781] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output := result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2192_c7_002a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2189_c7_6781] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2189_c7_6781_cond <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_cond;
     t16_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue;
     t16_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_return_output := t16_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2189_c7_6781] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2189_c7_6781] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output := result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_2104] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;

     -- printf_uxn_opcodes_h_l2177_c3_0868[uxn_opcodes_h_l2177_c3_0868] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2177_c3_0868_uxn_opcodes_h_l2177_c3_0868_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2177_c3_0868_uxn_opcodes_h_l2177_c3_0868_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2192_c7_002a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_002a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2189_c7_6781] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_6781] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;

     -- n8_MUX[uxn_opcodes_h_l2184_c7_66f9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2184_c7_66f9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_cond;
     n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue;
     n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output := n8_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2184_c7_66f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2184_c7_66f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_cond;
     t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue;
     t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output := t16_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_66f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c2_3603] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2184_c7_66f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2184_c7_66f9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output := result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2189_c7_6781] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_6781_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_66f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2181_c7_2104] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output := result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;

     -- n8_MUX[uxn_opcodes_h_l2181_c7_2104] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2181_c7_2104_cond <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_cond;
     n8_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue;
     n8_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_return_output := n8_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2181_c7_2104] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output := result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_66f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_2104] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2184_c7_66f9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2181_c7_2104] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2181_c7_2104_cond <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_cond;
     t16_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue;
     t16_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_return_output := t16_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_66f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c2_3603] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2176_c2_3603] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output := result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output;

     -- t16_MUX[uxn_opcodes_h_l2176_c2_3603] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2176_c2_3603_cond <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_cond;
     t16_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue;
     t16_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_return_output := t16_MUX_uxn_opcodes_h_l2176_c2_3603_return_output;

     -- n8_MUX[uxn_opcodes_h_l2176_c2_3603] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2176_c2_3603_cond <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_cond;
     n8_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue;
     n8_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_return_output := n8_MUX_uxn_opcodes_h_l2176_c2_3603_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2176_c2_3603] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output := result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2181_c7_2104] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_2104] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_2104] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2176_c2_3603_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_2104_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2176_c2_3603_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c2_3603] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c2_3603] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2176_c2_3603] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l2171_l2206_DUPLICATE_a1b5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l2171_l2206_DUPLICATE_a1b5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ed17(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_3603_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_3603_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l2171_l2206_DUPLICATE_a1b5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ed17_uxn_opcodes_h_l2171_l2206_DUPLICATE_a1b5_return_output;
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
