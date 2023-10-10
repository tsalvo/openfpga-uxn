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
-- Submodules: 65
entity equ_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ_0CLK_7c2e709f;
architecture arch of equ_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1297_c6_f343]
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1297_c1_219b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1297_c2_d155]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1297_c2_d155]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1297_c2_d155]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1297_c2_d155]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1297_c2_d155]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1297_c2_d155]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1297_c2_d155]
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1297_c2_d155]
signal t8_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1297_c2_d155]
signal n8_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1298_c3_7767[uxn_opcodes_h_l1298_c3_7767]
signal printf_uxn_opcodes_h_l1298_c3_7767_uxn_opcodes_h_l1298_c3_7767_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_f451]
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1303_c7_8b37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1303_c7_8b37]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_8b37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_8b37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_8b37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_8b37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1303_c7_8b37]
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1303_c7_8b37]
signal t8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1303_c7_8b37]
signal n8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_3283]
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_d8d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1306_c7_d8d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_d8d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_d8d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_d8d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_d8d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1306_c7_d8d1]
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1306_c7_d8d1]
signal t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1306_c7_d8d1]
signal n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_6f5e]
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1310_c7_6869]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1310_c7_6869]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_6869]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_6869]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_6869]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_6869]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1310_c7_6869]
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1310_c7_6869]
signal n8_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1313_c11_9715]
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1313_c7_7d71]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1313_c7_7d71]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1313_c7_7d71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1313_c7_7d71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1313_c7_7d71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1313_c7_7d71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1313_c7_7d71]
signal result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1313_c7_7d71]
signal n8_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1317_c32_755d]
signal BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1317_c32_1b44]
signal BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1317_c32_2c45]
signal MUX_uxn_opcodes_h_l1317_c32_2c45_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1317_c32_2c45_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1317_c32_2c45_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1317_c32_2c45_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_a820]
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1319_c7_fd12]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_fd12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_fd12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_fd12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1319_c7_fd12]
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1323_c24_2664]
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1323_c24_83f1]
signal MUX_uxn_opcodes_h_l1323_c24_83f1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1323_c24_83f1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1323_c24_83f1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1323_c24_83f1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1325_c11_51b2]
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1325_c7_4ef1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1325_c7_4ef1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343
BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_left,
BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_right,
BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155
result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_cond,
result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_return_output);

-- t8_MUX_uxn_opcodes_h_l1297_c2_d155
t8_MUX_uxn_opcodes_h_l1297_c2_d155 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1297_c2_d155_cond,
t8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue,
t8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse,
t8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output);

-- n8_MUX_uxn_opcodes_h_l1297_c2_d155
n8_MUX_uxn_opcodes_h_l1297_c2_d155 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1297_c2_d155_cond,
n8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue,
n8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse,
n8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output);

-- printf_uxn_opcodes_h_l1298_c3_7767_uxn_opcodes_h_l1298_c3_7767
printf_uxn_opcodes_h_l1298_c3_7767_uxn_opcodes_h_l1298_c3_7767 : entity work.printf_uxn_opcodes_h_l1298_c3_7767_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1298_c3_7767_uxn_opcodes_h_l1298_c3_7767_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_left,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_right,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37
result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_cond,
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output);

-- t8_MUX_uxn_opcodes_h_l1303_c7_8b37
t8_MUX_uxn_opcodes_h_l1303_c7_8b37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond,
t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue,
t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse,
t8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output);

-- n8_MUX_uxn_opcodes_h_l1303_c7_8b37
n8_MUX_uxn_opcodes_h_l1303_c7_8b37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond,
n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue,
n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse,
n8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_left,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_right,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output);

-- t8_MUX_uxn_opcodes_h_l1306_c7_d8d1
t8_MUX_uxn_opcodes_h_l1306_c7_d8d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond,
t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue,
t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse,
t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output);

-- n8_MUX_uxn_opcodes_h_l1306_c7_d8d1
n8_MUX_uxn_opcodes_h_l1306_c7_d8d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond,
n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue,
n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse,
n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_left,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_right,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_cond,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_return_output);

-- n8_MUX_uxn_opcodes_h_l1310_c7_6869
n8_MUX_uxn_opcodes_h_l1310_c7_6869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1310_c7_6869_cond,
n8_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue,
n8_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse,
n8_MUX_uxn_opcodes_h_l1310_c7_6869_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_left,
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_right,
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71
result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71
result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_cond,
result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output);

-- n8_MUX_uxn_opcodes_h_l1313_c7_7d71
n8_MUX_uxn_opcodes_h_l1313_c7_7d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1313_c7_7d71_cond,
n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue,
n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse,
n8_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d
BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_left,
BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_right,
BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44
BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_left,
BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_right,
BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_return_output);

-- MUX_uxn_opcodes_h_l1317_c32_2c45
MUX_uxn_opcodes_h_l1317_c32_2c45 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1317_c32_2c45_cond,
MUX_uxn_opcodes_h_l1317_c32_2c45_iftrue,
MUX_uxn_opcodes_h_l1317_c32_2c45_iffalse,
MUX_uxn_opcodes_h_l1317_c32_2c45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_left,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_right,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_cond,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664
BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_left,
BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_right,
BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_return_output);

-- MUX_uxn_opcodes_h_l1323_c24_83f1
MUX_uxn_opcodes_h_l1323_c24_83f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1323_c24_83f1_cond,
MUX_uxn_opcodes_h_l1323_c24_83f1_iftrue,
MUX_uxn_opcodes_h_l1323_c24_83f1_iffalse,
MUX_uxn_opcodes_h_l1323_c24_83f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_left,
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_right,
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
 t8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
 n8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output,
 t8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output,
 n8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output,
 t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output,
 n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_return_output,
 n8_MUX_uxn_opcodes_h_l1310_c7_6869_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output,
 n8_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_return_output,
 MUX_uxn_opcodes_h_l1317_c32_2c45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_return_output,
 MUX_uxn_opcodes_h_l1323_c24_83f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_5542 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1298_c3_7767_uxn_opcodes_h_l1298_c3_7767_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_59b5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_8391 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_a043 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1322_c3_b2f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1310_DUPLICATE_309c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1313_l1310_DUPLICATE_8e37_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1325_l1313_l1310_DUPLICATE_545a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1313_l1310_DUPLICATE_a44a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1303_l1313_l1306_l1310_DUPLICATE_f995_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1306_l1303_l1325_l1319_l1313_l1310_DUPLICATE_3b45_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1313_l1319_DUPLICATE_5356_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1330_l1293_DUPLICATE_68a8_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_5542 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_5542;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_59b5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_59b5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_8391 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_8391;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_a043 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_a043;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1322_c3_b2f4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1322_c3_b2f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1323_c24_2664] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_left;
     BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_return_output := BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1306_l1303_l1325_l1319_l1313_l1310_DUPLICATE_3b45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1306_l1303_l1325_l1319_l1313_l1310_DUPLICATE_3b45_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1317_c32_755d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_left;
     BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_return_output := BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1313_l1310_DUPLICATE_a44a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1313_l1310_DUPLICATE_a44a_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_6f5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1303_l1313_l1306_l1310_DUPLICATE_f995 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1303_l1313_l1306_l1310_DUPLICATE_f995_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1310_DUPLICATE_309c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1310_DUPLICATE_309c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1313_l1310_DUPLICATE_8e37 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1313_l1310_DUPLICATE_8e37_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1325_l1313_l1310_DUPLICATE_545a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1325_l1313_l1310_DUPLICATE_545a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1313_c11_9715] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_left;
     BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output := BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_f451] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_left;
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output := BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1325_c11_51b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_a820] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_left;
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_return_output := BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1297_c6_f343] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_left;
     BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output := BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1313_l1319_DUPLICATE_5356 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1313_l1319_DUPLICATE_5356_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_3283] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_left;
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output := BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1317_c32_755d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c6_f343_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_f451_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_3283_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_6f5e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_9715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a820_return_output;
     VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c24_2664_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_51b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1313_l1310_DUPLICATE_8e37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1313_l1310_DUPLICATE_8e37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1313_l1310_DUPLICATE_8e37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1313_l1310_DUPLICATE_8e37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1313_l1310_DUPLICATE_8e37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1306_l1303_l1325_l1319_l1313_l1310_DUPLICATE_3b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1306_l1303_l1325_l1319_l1313_l1310_DUPLICATE_3b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1306_l1303_l1325_l1319_l1313_l1310_DUPLICATE_3b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1306_l1303_l1325_l1319_l1313_l1310_DUPLICATE_3b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1306_l1303_l1325_l1319_l1313_l1310_DUPLICATE_3b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1306_l1303_l1325_l1319_l1313_l1310_DUPLICATE_3b45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1310_DUPLICATE_309c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1310_DUPLICATE_309c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1310_DUPLICATE_309c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1310_DUPLICATE_309c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1310_DUPLICATE_309c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1303_l1313_l1306_l1310_DUPLICATE_f995_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1303_l1313_l1306_l1310_DUPLICATE_f995_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1303_l1313_l1306_l1310_DUPLICATE_f995_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1303_l1313_l1306_l1310_DUPLICATE_f995_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1325_l1313_l1310_DUPLICATE_545a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1325_l1313_l1310_DUPLICATE_545a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1325_l1313_l1310_DUPLICATE_545a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1325_l1313_l1310_DUPLICATE_545a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1325_l1313_l1310_DUPLICATE_545a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1325_l1313_l1310_DUPLICATE_545a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1313_l1319_DUPLICATE_5356_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1313_l1319_DUPLICATE_5356_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1313_l1310_DUPLICATE_a44a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1313_l1310_DUPLICATE_a44a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1313_l1310_DUPLICATE_a44a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1313_l1310_DUPLICATE_a44a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1313_l1310_DUPLICATE_a44a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1306_l1303_l1297_l1319_l1313_l1310_DUPLICATE_a44a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1325_c7_4ef1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1319_c7_fd12] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1317_c32_1b44] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_left;
     BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_return_output := BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1297_c1_219b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_fd12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output;

     -- t8_MUX[uxn_opcodes_h_l1306_c7_d8d1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond;
     t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue;
     t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output := t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1325_c7_4ef1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1313_c7_7d71] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;

     -- n8_MUX[uxn_opcodes_h_l1313_c7_7d71] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1313_c7_7d71_cond <= VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_cond;
     n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue;
     n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output := n8_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;

     -- MUX[uxn_opcodes_h_l1323_c24_83f1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1323_c24_83f1_cond <= VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_cond;
     MUX_uxn_opcodes_h_l1323_c24_83f1_iftrue <= VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_iftrue;
     MUX_uxn_opcodes_h_l1323_c24_83f1_iffalse <= VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_return_output := MUX_uxn_opcodes_h_l1323_c24_83f1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1317_c32_1b44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue := VAR_MUX_uxn_opcodes_h_l1323_c24_83f1_return_output;
     VAR_printf_uxn_opcodes_h_l1298_c3_7767_uxn_opcodes_h_l1298_c3_7767_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1297_c1_219b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_4ef1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1319_c7_fd12] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output := result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output;

     -- n8_MUX[uxn_opcodes_h_l1310_c7_6869] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1310_c7_6869_cond <= VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_cond;
     n8_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue;
     n8_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_return_output := n8_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1310_c7_6869] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_fd12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output;

     -- t8_MUX[uxn_opcodes_h_l1303_c7_8b37] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond <= VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond;
     t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue;
     t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output := t8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1313_c7_7d71] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_fd12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output;

     -- MUX[uxn_opcodes_h_l1317_c32_2c45] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1317_c32_2c45_cond <= VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_cond;
     MUX_uxn_opcodes_h_l1317_c32_2c45_iftrue <= VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_iftrue;
     MUX_uxn_opcodes_h_l1317_c32_2c45_iffalse <= VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_return_output := MUX_uxn_opcodes_h_l1317_c32_2c45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1313_c7_7d71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;

     -- printf_uxn_opcodes_h_l1298_c3_7767[uxn_opcodes_h_l1298_c3_7767] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1298_c3_7767_uxn_opcodes_h_l1298_c3_7767_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1298_c3_7767_uxn_opcodes_h_l1298_c3_7767_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue := VAR_MUX_uxn_opcodes_h_l1317_c32_2c45_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_fd12_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1313_c7_7d71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1313_c7_7d71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;

     -- n8_MUX[uxn_opcodes_h_l1306_c7_d8d1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond <= VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond;
     n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue;
     n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output := n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1313_c7_7d71] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output := result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1313_c7_7d71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_6869] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;

     -- t8_MUX[uxn_opcodes_h_l1297_c2_d155] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1297_c2_d155_cond <= VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_cond;
     t8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue;
     t8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output := t8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1310_c7_6869] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1306_c7_d8d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_7d71_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_d8d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_6869] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1310_c7_6869] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_return_output := result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;

     -- n8_MUX[uxn_opcodes_h_l1303_c7_8b37] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond <= VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_cond;
     n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue;
     n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output := n8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_6869] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1303_c7_8b37] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_6869] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_d8d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_6869_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1297_c2_d155] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1303_c7_8b37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_8b37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_d8d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1297_c2_d155] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1297_c2_d155_cond <= VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_cond;
     n8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue;
     n8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output := n8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_d8d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1306_c7_d8d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_d8d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1297_c2_d155_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_d8d1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_8b37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_8b37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1297_c2_d155] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1297_c2_d155] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_8b37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1303_c7_8b37] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output := result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_8b37_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1297_c2_d155] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1297_c2_d155] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_return_output := result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1297_c2_d155] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1297_c2_d155] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1330_l1293_DUPLICATE_68a8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1330_l1293_DUPLICATE_68a8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c2_d155_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c2_d155_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1330_l1293_DUPLICATE_68a8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1330_l1293_DUPLICATE_68a8_return_output;
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
