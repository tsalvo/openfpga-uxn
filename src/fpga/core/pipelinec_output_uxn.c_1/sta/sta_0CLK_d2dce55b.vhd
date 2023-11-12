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
-- BIN_OP_EQ[uxn_opcodes_h_l2176_c6_340c]
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2176_c1_cb97]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2176_c2_c167]
signal n8_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2176_c2_c167]
signal t16_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2176_c2_c167]
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2176_c2_c167]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c2_c167]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c2_c167]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c2_c167]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c2_c167]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2176_c2_c167]
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2177_c3_fdb5[uxn_opcodes_h_l2177_c3_fdb5]
signal printf_uxn_opcodes_h_l2177_c3_fdb5_uxn_opcodes_h_l2177_c3_fdb5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_afee]
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2181_c7_f68d]
signal n8_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2181_c7_f68d]
signal t16_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2181_c7_f68d]
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2181_c7_f68d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_f68d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_f68d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_f68d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_f68d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2181_c7_f68d]
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_1a56]
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2184_c7_3fc3]
signal n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2184_c7_3fc3]
signal t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2184_c7_3fc3]
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2184_c7_3fc3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2184_c7_3fc3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_3fc3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_3fc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_3fc3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2184_c7_3fc3]
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2186_c3_a1f8]
signal CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_e435]
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2189_c7_951d]
signal n8_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2189_c7_951d]
signal t16_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2189_c7_951d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2189_c7_951d]
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2189_c7_951d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_951d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2189_c7_951d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2189_c7_951d]
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2190_c3_feeb]
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2192_c11_6678]
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2192_c7_aa57]
signal n8_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2192_c7_aa57]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2192_c7_aa57]
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2192_c7_aa57]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2192_c7_aa57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2192_c7_aa57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2192_c7_aa57]
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2195_c30_945f]
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_fa1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_c2c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_c2c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2200_c7_c2c1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8efe( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_left,
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_right,
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_return_output);

-- n8_MUX_uxn_opcodes_h_l2176_c2_c167
n8_MUX_uxn_opcodes_h_l2176_c2_c167 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2176_c2_c167_cond,
n8_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue,
n8_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse,
n8_MUX_uxn_opcodes_h_l2176_c2_c167_return_output);

-- t16_MUX_uxn_opcodes_h_l2176_c2_c167
t16_MUX_uxn_opcodes_h_l2176_c2_c167 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2176_c2_c167_cond,
t16_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue,
t16_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse,
t16_MUX_uxn_opcodes_h_l2176_c2_c167_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output);

-- printf_uxn_opcodes_h_l2177_c3_fdb5_uxn_opcodes_h_l2177_c3_fdb5
printf_uxn_opcodes_h_l2177_c3_fdb5_uxn_opcodes_h_l2177_c3_fdb5 : entity work.printf_uxn_opcodes_h_l2177_c3_fdb5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2177_c3_fdb5_uxn_opcodes_h_l2177_c3_fdb5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_left,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_right,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output);

-- n8_MUX_uxn_opcodes_h_l2181_c7_f68d
n8_MUX_uxn_opcodes_h_l2181_c7_f68d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2181_c7_f68d_cond,
n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue,
n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse,
n8_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output);

-- t16_MUX_uxn_opcodes_h_l2181_c7_f68d
t16_MUX_uxn_opcodes_h_l2181_c7_f68d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2181_c7_f68d_cond,
t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue,
t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse,
t16_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_left,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_right,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output);

-- n8_MUX_uxn_opcodes_h_l2184_c7_3fc3
n8_MUX_uxn_opcodes_h_l2184_c7_3fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond,
n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue,
n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse,
n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output);

-- t16_MUX_uxn_opcodes_h_l2184_c7_3fc3
t16_MUX_uxn_opcodes_h_l2184_c7_3fc3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond,
t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue,
t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse,
t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8
CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_x,
CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_left,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_right,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output);

-- n8_MUX_uxn_opcodes_h_l2189_c7_951d
n8_MUX_uxn_opcodes_h_l2189_c7_951d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2189_c7_951d_cond,
n8_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue,
n8_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse,
n8_MUX_uxn_opcodes_h_l2189_c7_951d_return_output);

-- t16_MUX_uxn_opcodes_h_l2189_c7_951d
t16_MUX_uxn_opcodes_h_l2189_c7_951d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2189_c7_951d_cond,
t16_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue,
t16_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse,
t16_MUX_uxn_opcodes_h_l2189_c7_951d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb
BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_left,
BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_right,
BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_left,
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_right,
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output);

-- n8_MUX_uxn_opcodes_h_l2192_c7_aa57
n8_MUX_uxn_opcodes_h_l2192_c7_aa57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2192_c7_aa57_cond,
n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue,
n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse,
n8_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond,
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond,
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2195_c30_945f
sp_relative_shift_uxn_opcodes_h_l2195_c30_945f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_ins,
sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_x,
sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_y,
sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_return_output,
 n8_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
 t16_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output,
 n8_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output,
 t16_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output,
 n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output,
 t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output,
 CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output,
 n8_MUX_uxn_opcodes_h_l2189_c7_951d_return_output,
 t16_MUX_uxn_opcodes_h_l2189_c7_951d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output,
 n8_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output,
 sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_8e0e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2177_c3_fdb5_uxn_opcodes_h_l2177_c3_fdb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_ed09 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_9623 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2184_c7_3fc3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_6a3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_6e20_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_75a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_58f9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_39d6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_71b3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2185_l2190_DUPLICATE_0a78_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l2206_l2171_DUPLICATE_3327_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_ed09 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_ed09;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_8e0e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_8e0e;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_9623 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_9623;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_75a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_75a2_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_71b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_71b3_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2185_l2190_DUPLICATE_0a78 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2185_l2190_DUPLICATE_0a78_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_58f9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_58f9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2192_c11_6678] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_left;
     BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output := BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_6a3d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_6a3d_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l2195_c30_945f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_ins;
     sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_x;
     sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_return_output := sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_e435] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_left;
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output := BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2176_c6_340c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_6e20 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_6e20_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_afee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_1a56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_left;
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output := BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_39d6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_39d6_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2184_c7_3fc3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2184_c7_3fc3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_fa1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_340c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_afee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_1a56_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_e435_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_6678_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_fa1f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2185_l2190_DUPLICATE_0a78_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2185_l2190_DUPLICATE_0a78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_58f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_58f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_58f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_58f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_58f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_6a3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_6a3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_6a3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_6a3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_6a3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_71b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_71b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_71b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_71b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2200_l2192_l2189_l2184_l2181_DUPLICATE_71b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_6e20_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_6e20_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_6e20_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_6e20_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_6e20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_75a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_75a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_75a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_75a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2200_l2189_l2184_l2181_DUPLICATE_75a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_39d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_39d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_39d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_39d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2192_l2189_l2184_l2181_DUPLICATE_39d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2184_c7_3fc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2195_c30_945f_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2190_c3_feeb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_left;
     BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_return_output := BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_c2c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2186_c3_a1f8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_return_output := CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2176_c1_cb97] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2184_c7_3fc3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2192_c7_aa57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2200_c7_c2c1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_c2c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2192_c7_aa57] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output := result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;

     -- n8_MUX[uxn_opcodes_h_l2192_c7_aa57] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2192_c7_aa57_cond <= VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_cond;
     n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue;
     n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output := n8_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2192_c7_aa57] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output := result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_feeb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_a1f8_return_output;
     VAR_printf_uxn_opcodes_h_l2177_c3_fdb5_uxn_opcodes_h_l2177_c3_fdb5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_cb97_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_c2c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2192_c7_aa57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;

     -- t16_MUX[uxn_opcodes_h_l2189_c7_951d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2189_c7_951d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_cond;
     t16_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue;
     t16_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_return_output := t16_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2192_c7_aa57] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2189_c7_951d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2189_c7_951d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2189_c7_951d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output := result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2189_c7_951d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2189_c7_951d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_cond;
     n8_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue;
     n8_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_return_output := n8_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_f68d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2192_c7_aa57] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;

     -- printf_uxn_opcodes_h_l2177_c3_fdb5[uxn_opcodes_h_l2177_c3_fdb5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2177_c3_fdb5_uxn_opcodes_h_l2177_c3_fdb5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2177_c3_fdb5_uxn_opcodes_h_l2177_c3_fdb5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_aa57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2184_c7_3fc3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2184_c7_3fc3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output := result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_3fc3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_951d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2184_c7_3fc3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond;
     n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue;
     n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output := n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c2_c167] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2189_c7_951d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2184_c7_3fc3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond;
     t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue;
     t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output := t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2189_c7_951d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_951d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2184_c7_3fc3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_3fc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2181_c7_f68d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2181_c7_f68d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_cond;
     t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue;
     t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output := t16_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2181_c7_f68d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2181_c7_f68d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_cond;
     n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue;
     n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output := n8_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2181_c7_f68d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2181_c7_f68d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output := result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_f68d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_3fc3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_3fc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2181_c7_f68d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2176_c2_c167] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output := result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_f68d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_f68d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2176_c2_c167] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2176_c2_c167_cond <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_cond;
     n8_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue;
     n8_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_return_output := n8_MUX_uxn_opcodes_h_l2176_c2_c167_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c2_c167] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2176_c2_c167] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output := result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output;

     -- t16_MUX[uxn_opcodes_h_l2176_c2_c167] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2176_c2_c167_cond <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_cond;
     t16_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue;
     t16_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_return_output := t16_MUX_uxn_opcodes_h_l2176_c2_c167_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c167_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_f68d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c167_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c2_c167] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2176_c2_c167] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c2_c167] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l2206_l2171_DUPLICATE_3327 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l2206_l2171_DUPLICATE_3327_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8efe(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c167_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c167_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l2206_l2171_DUPLICATE_3327_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l2206_l2171_DUPLICATE_3327_return_output;
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
